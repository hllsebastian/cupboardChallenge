// ignore_for_file: avoid_unnecessary_containers
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:cupboard/models/products_model.dart';
import 'package:cupboard/services/product_services.dart';
import 'package:cupboard/widgets/down_button.dart';
import 'package:cupboard/widgets/sidebar.dart';


class ProductsPage extends StatelessWidget {

  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final productService = Provider.of<ProductService>(context);

    return Scaffold(
      endDrawer: const SideBar(),
      appBar: AppBar(
        title: const Text('Productos', style: TextStyle(fontSize: 30),),
      ),
      body: ListView.builder (
        itemCount: productService.productslist.length,
        itemBuilder: (_, index) => _ProductName(
          product: productService.productslist[index],
        )
      ),

      persistentFooterButtons: [
       const DownButton(iconOption: Icons.home,  route: '/',),
      
       Padding(
         padding: const EdgeInsets.only(left: 25),
         child: IconButton(
          iconSize: 37,
          icon: const Icon(Icons.add), 
           onPressed: () {
             productService.selectedProduct = ProductsModel(
               nameProduct: '',
               idMark: productService.productslist.first.idMark,
               barCode: '',
             );
             Navigator.pushNamed(context, 'addProduct');
           }, 
         ),
       ),
       //const DownButton(iconOption: Icons.add,   route: 'addProduct',),
      
       const DownButton(iconOption: Icons.close, route: '/',),
      ],
    );
  }
}

class _ProductName extends StatelessWidget {

  final ProductsModel product;

  const _ProductName({
    Key? key, required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final productService = Provider.of<ProductService>(context);
    final index = productService.productslist.indexWhere((x) => x.idProduct == product.idProduct);
    return Container(
      height: 120,
      //margin: EdgeInsets.all(20),

      padding:    const EdgeInsets.all(10),
      decoration: const BoxDecoration(

      ),
      child: Card(
        
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            
            Padding (
              padding: const EdgeInsets.only(bottom: 35, left: 10),
              child:   Text(product.nameProduct, style: const TextStyle(fontSize: 22),)),
            Expanded(child: Container()),

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                const Text('Editar', style: TextStyle(fontSize: 15),),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.deepPurple),
                  onPressed: () {
                    productService.selectedProduct = productService.productslist[index];
                    Navigator.pushNamed(context, 'addProduct');
                  },  
                )
              ],),
            ),
            Expanded(child: Container()),

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(children: [
                const Text('Eliminar', style: TextStyle(fontSize: 15),),
                IconButton(
                  icon: const Icon(Icons.delete, 
                  color: Colors.deepPurple,
                 ),
                onPressed: (){
                  final dialog = AlertDialog(
                      title: Text('¿Desea eliminar ${product.nameProduct}?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancelar')),
                        TextButton(
                          child: const Text('Borrar'),
                          onPressed: () async {
                            await productService.deleteProduct('${product.idProduct}');
                            Navigator.of(context).pop();
                            const ProductsPage();
                          },
                        ),
                      ]);
                      showDialog(context: context, builder: (_) => dialog);
                } 
                )
              ],),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }

    /* _showForm(BuildContext context){
      
      showDialog(

        context: context,
        builder: (context){
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: const Text('Editing Product'),
            content: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.deepPurple,
                          width: 3,
                        ) 
                      ),

                     /*  enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.purple
                        )
                      ), */
                     /*  border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      ), */
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: 'New name',
                      hintText: 'Insert new Product name',
                    ),
                  ),
                  
                 /*  IconButton(
                    onPressed: (){}, 
                    icon:  const Icon(Icons.save, color: Colors.deepPurple)
                  ) */
                
                ],
                
              )),
              
              actions: [
                
                TextButton(
                  child: const Text('Cancel', style: TextStyle(color: Colors.purpleAccent),),
                  onPressed: ()=> Navigator.of(context).pop(  ),
                ),
                const SizedBox(width: 60,),
                
                TextButton(
                  child: const Text('Save', style: TextStyle(color: Colors.purpleAccent),),
                  onPressed: ()=> Navigator.of(context).pop(  ),
                ), 

                const SizedBox(width: 30,),
              ],
          );
        }
      );
    } */
    
}

