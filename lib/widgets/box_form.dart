import 'package:flutter/material.dart';

// Caja donede estoy guardando el formulario

class BoxForm extends StatelessWidget {

  final Widget child;

  const BoxForm({
    Key? key, 
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _PurpleBox(),
          this.child
        ],
      )


    );
  }
}

class _PurpleBox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final sizeScreen = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: sizeScreen.height * 0.4,
      decoration: PurpleDecoration(),
      child: Stack(
        children: [
          Positioned(child: _Bubble(), top: 90, left: 100,),
          Positioned(child: _Bubble(), top: 200, right: 20,),
          Positioned(child: _Bubble(), top: 250, left: -10,),
          /* Positioned(child: _Bubble(), top: 90, left: 30,),
          Positioned(child: _Bubble(), top: -40, right: 30,), */
          
        ],
      ),

    );
  }

  BoxDecoration PurpleDecoration() => const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xffFDF9FE),
        Color(0xffA11CDB),
      ]  
    )
  );
}

class _Bubble extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color.fromRGBO(255, 255, 255, 0.1)
      ),
    );
  }
}
