
import 'package:cupboard/widgets/down_button.dart';
import 'package:cupboard/widgets/sidebar.dart';
import 'package:flutter/material.dart';


class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: SideBar(),
      appBar: AppBar(
        title: const Text('Categories', style: TextStyle(fontSize: 30),),
      ),
      body: ListView.builder(
        itemBuilder: (_, index) => Container(
          child: _CategoryName(),
        )
      ),

      persistentFooterButtons: const [
       DownButton(iconOption: Icons.home,  route: '/'),
       DownButton(iconOption: Icons.add,   route: '/'),
       DownButton(iconOption: Icons.close, route: '/'),
      ],
    );

        
      
  }
}

class _CategoryName extends StatelessWidget {
  const _CategoryName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            
           const Padding (
              padding: EdgeInsets.only(bottom: 35, left: 10),
              child:   Text('Category Name', style: TextStyle(fontSize: 22),)),
            Expanded(child: Container()),

            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                const Text('Edite', style: TextStyle(fontSize: 15),),
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.deepPurple),
                  onPressed: () => _showForm(context),  
                )
              ],),
            ),
            Expanded(child: Container()),

            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(children: [
                const Text('Delete', style: TextStyle(fontSize: 15),),
                IconButton(onPressed: (){}, icon: const Icon(Icons.delete, color: Colors.deepPurple,))
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
                SizedBox(width: 60,),
                
                TextButton(
                  child: const Text('Save', style: TextStyle(color: Colors.purpleAccent),),
                  onPressed: ()=> Navigator.of(context).pop(  ),
                ), 

                SizedBox(width: 30,),
              ],

          );
        }

      );
       
    
    }
    
}

