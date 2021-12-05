import 'package:flutter/material.dart';


class SideBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ClipRRect (
      borderRadius: BorderRadius.circular(50),
      child: Drawer(
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffFFF8F8),
                Color(0xffFFF0F0),
              ]
            )
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: DrawerHeader(
                    decoration: const BoxDecoration(
                      //color: Colors.black26, 
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      gradient: LinearGradient(
                       begin: Alignment.topCenter,
                       end: Alignment.bottomCenter,
                       colors: <Color>[
                         Color(0xff8C14BD),
                         Color(0xff9B4ABC ),
                      ])
                    ),
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Text('Choose an option', style: TextStyle(fontSize: 20), )
                    )
                ),
              ),

             PagesCupboard(namePage: 'Brands', routePage: 'marcas'),
             const Divider(),
             PagesCupboard(namePage: 'Category', routePage: 'categories'),
             const Divider(),
             PagesCupboard(namePage: 'Cupboard', routePage: '/'),
             const Divider(),
             PagesCupboard(namePage: 'Products', routePage: 'products'),
             const Divider(),
             PagesCupboard(namePage: 'Home', routePage: '/'),
             const Divider(),
             PagesCupboard(namePage: 'Close', routePage: '/'),

            ],
          ),
        ),
      ),
    );
  }
}

class PagesCupboard extends StatelessWidget {

  final String namePage; 
  final String routePage;

  PagesCupboard({
    required this.namePage, 
    required this.routePage
    });


  @override
  Widget build(BuildContext context) {


    return  ListTile(
       title: Text(namePage, style: TextStyle(fontSize: 17)),
       onTap: () => Navigator.popAndPushNamed(context, routePage)
     );
    }
}