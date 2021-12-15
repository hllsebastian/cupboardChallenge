import 'package:cupboard/models/trademark_model.dart';
import 'package:cupboard/pages/products_page.dart';
import 'package:cupboard/providers/product_provider.dart';
import 'package:cupboard/services/product_services.dart';
import 'package:cupboard/services/trademark_service.dart';
import 'package:cupboard/widgets/box_form.dart';
import 'package:cupboard/widgets/form_card.dart';
import 'package:cupboard/widgets/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddProductsPage extends StatelessWidget {
  const AddProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final productService = Provider.of<ProductService>(context);
    final ProductProvider myProvider = ProductProvider(productService.selectedProduct);
    
    return ChangeNotifierProvider(
      create: (context) => myProvider,
      child:  _FormProduct(service: productService)
    );
  }
}

class _FormProduct extends StatelessWidget {

  final ProductService service;
  const _FormProduct({Key? key, required this.service}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final tradeMarkService = Provider.of<TrademarkService>(context);
    final productForm = Provider.of<ProductProvider>(context);
    final productProvider = productForm.productModel;

    return Scaffold(
      endDrawer: const SideBar(),
      appBar: AppBar(
        title: const Text('Agregar Producto'),
        backgroundColor: Colors.purple,
      ),
      body: BoxForm(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 100,),

              FormCard(child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10,), 

                    Text('Ingresar nuevo producto', style: Theme.of(context).textTheme.headline4, textAlign: TextAlign.center,),
                    const SizedBox(height: 5), 

                     DropdownButton(
                      icon: const Icon(Icons.arrow_downward_outlined),
                      isExpanded: true,
                      underline: Container(
                        height: 2,
                        color: Colors.indigo,
                      ),
                      hint: const Text('Elige una marca'),
                      value: productProvider.idMark,
                      items: tradeMarkService.trademarkslist.map((TrademarkModel value) {
                        return DropdownMenuItem<String>(
                          value: value.idTrademark,
                          child: Text(value.mark),
                        );
                      }).toList(),
                      onChanged: (value) => productForm.valueSelected(value.toString())
                     ),

                    TextFormField(
                      key: productForm.formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      autocorrect: false,
                      decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.purple, width: 2)),
                          labelText: 'Nombre del producto',
                          hintText: 'Ingresar datos',
                          labelStyle: TextStyle(color: Colors.blueGrey)),
                      initialValue: productProvider.nameProduct,
                      onChanged: (value) => productProvider.nameProduct = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo obligatorio';
                        }
                      },
                    ),
                    const SizedBox(height: 15,), 

                     TextButton.icon(
                        //style: ButtonStyle(backgroundColor:  ),
                        icon: const Icon(Icons.save_outlined,
                            size: 45, color: Colors.deepPurple),
                        label: const Text('Guardar',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 26)),
                        onPressed: service.isSaving
                            ? null
                            : () async {
                                if (productForm.isValidForm()) return;
                                await service.saveOrUpdateProduct(productProvider);
                                Navigator.of(context).pop();
                                const ProductsPage();
                              }),
                    const SizedBox(
                      height: 25,
                    ),

                    TextButton.icon(
                        icon: const Icon(Icons.cancel_outlined,
                            size: 45, color: Colors.deepPurple),
                        onPressed: () => Navigator.of(context).pop(),
                        label: const Text('Cancelar', style: TextStyle(color: Colors.black54, fontSize: 26)))

                    /* const _ProductForm(titlefield: 'Product Name',),
                    const _ProductForm(titlefield: 'Brand'),
                    const _ProductForm(titlefield: 'Expiration date'), */
                  ],
                ),
              ),)
            ],
          ),
        ),
      ),
    );
  }
}


