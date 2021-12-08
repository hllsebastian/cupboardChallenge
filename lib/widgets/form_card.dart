import 'package:flutter/material.dart';

class FormCard extends StatelessWidget {

  final Widget child;

  const FormCard({
    Key? key, 
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        decoration: cardFormdecoration(),
        child: child,
      ),
    );
  }

  BoxDecoration cardFormdecoration() =>  BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 15,
        offset: Offset(0, 5)
      )
    ]
  );
}