import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardFooter extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const _CardHeadarBackground(),
        Positioned(
          right: -10,
          child: FaIcon(FontAwesomeIcons.nutritionix, size: 100, color: Colors.white.withOpacity(0.2)),
        ),

        Positioned(
          top: 20,
          left: 100,
          child: Row(
            children: [
            
             const Text('Close Cupboard', style: TextStyle(fontSize: 15, color: Colors.white),),
             const SizedBox(width: 40,),
             IconButton(
               icon: const Icon(Icons.logout, color:Colors.white, size: 42,),
               onPressed: (){}
             ),   
          ]),
        ),

       /*  Positioned(
          right: 30,
          top: 50,
          child: RawMaterialButton(
            shape: const CircleBorder(),
            padding: const  EdgeInsets.all(10),
            onPressed: (){},
            child:const FaIcon(FontAwesomeIcons.ellipsisV, color: Colors.white,)))*/
      ],
    );
  }
}

class _CardHeadarBackground extends StatelessWidget {
  const _CardHeadarBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft : Radius.circular(40), 
              topRight: Radius.circular(40), 
              
              //topLeft: Radius.circular(60)
          ),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Color(0xffCE67F8),
                Color(0xffB20FF3),
              ])),
    );
  }
}
