import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// No la estoy usando. Iba a funcionar como un Appbar

class CardHeader extends StatelessWidget {
  
  final IconData icon;
  final String title;
  final String subtitle;
  final Color? color1;
  final Color? color2;

  final Color whiteColor = Colors.white.withOpacity(0.7);

   CardHeader({
    required this.icon, 
    required this.title, 
    required this.subtitle, 
    this.color1, 
    this.color2
  });


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const _CardHeadarBackground(),
     /*    /* Positioned(
          right: -10,
          child: FaIcon(icon, size: 100, color: Colors.white.withOpacity(0.2)),
        ), */ */

        Positioned(
          left: 80,
          child: Column(
            children: [
            //const SizedBox(height: 50,),
        
            Text(title, style: TextStyle(fontSize: 20, color: Colors.white)),
        
            const SizedBox(height: 20),
        
            Text(subtitle, style: TextStyle(fontSize: 20, color: Colors.white)),
          ]),
        ),

        /* Positioned(
          right: 30,
          top: 50,
          child: RawMaterialButton(
            shape: const CircleBorder(),
            padding: const  EdgeInsets.all(10),
            onPressed: (){},
            child:const FaIcon(FontAwesomeIcons.ellipsisV, color: Colors.white,))) */

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
      height: 99,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft : Radius.circular(40), 
              bottomRight: Radius.circular(40), 
              
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
