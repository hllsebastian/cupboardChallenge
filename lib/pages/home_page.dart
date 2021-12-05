import 'package:cupboard/widgets/footer_card.dart';
import 'package:cupboard/widgets/home_card.dart';
import 'package:cupboard/widgets/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: SideBar(),
      appBar: AppBar(
        title: const Text('Welcome to Cupboard'),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          /* CardHeader(
            icon: FontAwesomeIcons.nutritionix, 
            title: 'Welcome at Cupboard', 
            subtitle: 'Choose an option',
          ), */
          const Spacer(),
          HomeCard(
            title: 'Products Expired',
            icon: FontAwesomeIcons.sadTear,
            color1: const Color(0xffF96E63),
            color2: const Color(0xFFF0493B),
            onPress: (){},
          ),

          HomeCard(
            title: 'Products soon to expire',
            icon: FontAwesomeIcons.grin,
            color1: const Color(0xFF6380F9),
            color2: const Color(0xFF2D56FA),
            onPress: (){},
          ),

          HomeCard(
            title: 'Reports',
            icon: FontAwesomeIcons.smileWink,
            color1: const Color(0xff59CD42),
            color2: const Color(0xffF2EB014),
            onPress: (){},
          ),

          const Spacer(),
          CardFooter()
        ],
      ),
    );
  }
}