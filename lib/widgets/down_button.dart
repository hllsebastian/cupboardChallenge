import 'package:flutter/material.dart';

class DownButton extends StatelessWidget {

  final IconData iconOption;
  final String route;


  const DownButton({Key? key, required this.iconOption, required this.route}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 26, left: 27),
      child: IconButton(
        splashColor: Colors.deepPurpleAccent,
        iconSize: 37,
        icon: Icon(iconOption, color: Colors.deepPurple,),
        onPressed: () => Navigator.pushNamed(context, route),
      ),
    );
  }
}
