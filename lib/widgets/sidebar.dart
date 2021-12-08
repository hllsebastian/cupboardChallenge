import 'package:flutter/material.dart';


class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);


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
                      child: const Text('Choose an option', style: TextStyle(fontSize: 20), )
                    )
                ),
              ),

             const PagesCupboard(namePage: 'Brands', routePage: 'marcas'),
             const Divider(),
             const PagesCupboard(namePage: 'Category', routePage: 'categories'),
             const Divider(),
             const PagesCupboard(namePage: 'Cupboard', routePage: '/'),
             const Divider(),
             const PagesCupboard(namePage: 'Products', routePage: 'products'),
             const Divider(),
             const PagesCupboard(namePage: 'Home', routePage: '/'),
             const Divider(),
             const PagesCupboard(namePage: 'Close', routePage: '/'),

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

  const PagesCupboard({Key? key, 
    required this.namePage, 
    required this.routePage
    }) : super(key: key);


  @override
  Widget build(BuildContext context) {


    return  ListTile(
       title: Text(namePage, style: const TextStyle(fontSize: 17)),
       onTap: () => Navigator.popAndPushNamed(context, routePage)
     );
    }
}