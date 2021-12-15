
import 'package:cupboard/models/category_model.dart';
import 'package:cupboard/pages/loading_page.dart';
import 'package:cupboard/services/category_service.dart';
import 'package:cupboard/widgets/down_button.dart';
import 'package:cupboard/widgets/sidebar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CategoriesPage extends StatelessWidget {
  
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final categoryService = Provider.of<CategoryService>(context);
    if(categoryService.isLoading) return const LoadingPage();

    return Scaffold(
        endDrawer: const SideBar(),
        appBar: AppBar(
        title: const Text('Categories', style: TextStyle(fontSize: 30),),
      ),
      body: ListView.builder(
        itemCount: categoryService.categorylist.length,
        itemBuilder: (_, index) => _CategoryName(
          category: categoryService.categorylist[index],
        )
      ),

      persistentFooterButtons:  [
       const DownButton(iconOption: Icons.home,  route: '/'),
       Padding(
         padding: const EdgeInsets.only(left: 25),
         child: IconButton(
          iconSize: 37,
          icon: const Icon(Icons.add), 
           onPressed: () {
             categoryService.selectedCategory = CategoryModel(name: '');
             Navigator.pushNamed(context, 'addCategory');
           }, 
         ),
       ),
       //DownButton(iconOption: Icons.add,   route: 'addCategory'),
       const DownButton(iconOption: Icons.close, route: 'login'),
      ],
    );

        
      
  }
}

class _CategoryName extends StatelessWidget {
  
  final CategoryModel category;
  
  const _CategoryName({Key? key, required this.category,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final categoryService = Provider.of<CategoryService>(context);
    final index = categoryService.categorylist.indexWhere((x) => x.idcategory == category.idcategory);

    return Container(
      height: 120,
      //margin: EdgeInsets.all(20),

      padding:    const EdgeInsets.all(10),
      decoration: const BoxDecoration(

      ),
      child: Card(
        
        child: Row(
          children: [
            
            Padding (
              padding: const EdgeInsets.only(bottom: 35, left: 10),
              child:   Text(category.name, style: const TextStyle(fontSize: 22),)),
            Expanded(child: Container()),

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                const Text('Editar', style: TextStyle(fontSize: 15),),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.deepPurple),
                  onPressed: () {
                    categoryService.selectedCategory = categoryService.categorylist[index];
                    Navigator.pushNamed(context, 'addCategory');
                  },  
                )
              ],),
            ),
            Expanded(child: Container()),

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(children: [
                const Text('Ellimnar', style: TextStyle(fontSize: 15),),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.deepPurple),
                  onPressed: (){
                  final dialog = AlertDialog(
                      title: Text('¿Desea eliminar ${category.name}?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancelar')),
                        TextButton(
                          child: const Text('Borrar'),
                          onPressed: () async {
                            await categoryService.deleteCategory('${category.idcategory}');
                            Navigator.of(context).pop();
                            const CategoriesPage();
                          },
                        ),
                      ]);
                      showDialog(context: context, builder: (_) => dialog);
                }, 
                
                )
              ],),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }

    _showForm(BuildContext context){
      
      showDialog(

        context: context,
        builder: (context){
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: const Text('Editing Category'),
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
                      hintText: 'Insert new category name',
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
    }
}

