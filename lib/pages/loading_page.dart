import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text('Categories'),
      ),
      body: const Center(
        child: CircularProgressIndicator(color: Colors.deepPurple,),        
      ),
    );
  }
}