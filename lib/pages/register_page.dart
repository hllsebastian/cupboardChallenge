import 'package:cupboard/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<Logincontroller>(
      create: (_) => Logincontroller(),
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          decoration: _backGroundLogin(),
          /* width: double.infinity,
          height: double.infinity, */
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                TextFormField(
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                    labelText: 'Email'
                  ),
                ),

                TextFormField(
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                    labelText: 'Password'
                  ),
                )
              ],
            ),
          )
        ),
      )
    );
  }

  BoxDecoration _backGroundLogin() {
    return const BoxDecoration(
          gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,              
          colors: [
              Color(0xffF7E8FC),
              Color(0xff9418BB),

            ]
          )
        );
  }
}