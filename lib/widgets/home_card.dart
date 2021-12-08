import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class HomeCard extends StatelessWidget {

  final IconData? icon;
  final String title;
  final Color color1;
  final Color color2;
  final Function onPress;

   const HomeCard({Key? key, 
    this.icon = FontAwesomeIcons.nutritionix, 
    required this.title, 
    this.color1 = Colors.grey,
    this.color2 = Colors.blueGrey,
    required this.onPress
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress,
      child: Stack(
        children: [
          _FatbuttoBackground(icon: icon, color1: color1, color2: color2,),
    
          Row(children:  [
            const SizedBox(height: 80, width: 40),
            FaIcon(icon, size: 40, color: Colors.white,),
            const SizedBox(width: 20),
            Expanded(child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 15),)),
            /* FaIcon(FontAwesomeIcons.chevronRight, size: 10, color: Colors.white,),
            SizedBox(width: 60), */
         ],
        )
        ],
      ),
    );
  }
}

class _FatbuttoBackground extends StatelessWidget {

  final IconData? icon; 
  final Color color1;
  final Color color2;

  const _FatbuttoBackground({
    this.icon, 
    required this.color1, 
    required this.color2
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 163,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        //color: Colors.red,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.2), offset: const Offset(4,6), blurRadius: 10)
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            color1,
            color2,
          ]
        )
      ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [ 
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(icon, size: 100, color: Colors.white.withOpacity(0.5),),
            )
          ], 
        ),
      ),

    );
  }
}