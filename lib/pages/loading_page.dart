import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text('Cargando datos'),
      ),
      body: const Center(
        child: CircularProgressIndicator(color: Colors.deepPurple,),        
      ),
    );
  }
}