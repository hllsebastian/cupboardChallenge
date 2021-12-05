
import 'package:cupboard/providers/login_provider.dart';
import 'package:cupboard/services/auth_service.dart';
import 'package:cupboard/services/notification_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: 750,
            padding: const EdgeInsets.all(0),
            decoration: _backGroundLogin(),
            /* width: double.infinity,
             height: double.infinity, */
            child: ChangeNotifierProvider(
              create: (_) => LoginProvider(),
              child: const _LoginForm(),
            )),
      ),
    );
  }

  BoxDecoration _backGroundLogin() {
    return const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
          Color(0xff9418BB),
          Color(0xffF7E8FC),
        ]));
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({
    Key? key,
    //required this.login,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    final loginForm = Provider.of<LoginProvider>(context);

    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: loginForm.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const Text('Cupboard', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.white)
          ),

          const SizedBox(height: 20,),

          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
                  labelStyle:TextStyle(color: Colors.white, fontSize: 25),
                  prefixIcon: Icon(Icons.email, color: Colors.white,),
                  labelText: 'Email',
            ),

            onChanged: (value) => loginForm.email = value,
            validator: (value) {
               String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
               RegExp regExp = RegExp(pattern);
               return regExp.hasMatch(value ?? '')
                   ? null
                   : 'El valor ingresado no luce como un correo';
            }, 
          ),
         
          TextFormField(
            obscureText: true,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
                labelStyle: TextStyle(color: Colors.white, fontSize: 25),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                labelText: 'Password',
                hintText: '*********'
            ),

            onChanged: (value) => loginForm.password = value,
              validator: (value) {
                return (value != null && value.length >= 5)
                    ? null
                    : 'La contraseña debe tener minimo 5 caracteres';
              },
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.deepPurple,
                child: const Text('Open Cupboard',style: TextStyle(color: Colors.white,),
                ),

                onPressed: loginForm.isLoading ? null : () async{
                  final authService = Provider.of<AuthService>(context, listen: false);
                  FocusScope.of(context).unfocus();
                  
                  if( !loginForm.isValidForm() ) return;
                  loginForm.isLoading = true;

                  final String? errorMessage = await authService.login(loginForm.email, loginForm.password);

                  if ( errorMessage == null ) {
                    Navigator.pushReplacementNamed(context, '/');
                  } else {
                      //Se uso la el metodo estatico de la clase "NotificationsService"
                      NotificationsService.showSnackbar(errorMessage);
                      loginForm.isLoading = false;
                  }
                }
            ),
          ),

          /* Padding(
          padding: const EdgeInsets.all(12),
          child: TextButton(
            
            style:  TextButton.styleFrom(
              primary: Colors.white
            ),
            child: const Text('Open Cupboard', style: TextStyle(fontSize: 15),),
            onPressed: (){}, 
          ),
        ), */

          TextButton(
            style: TextButton.styleFrom(primary: Colors.white),
            child: const Text(
              '¿Olvidaste tu constraseña?',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {},
          ),
          TextButton(
            style: TextButton.styleFrom(primary: Colors.white),
            child: const Text(
              'Crear nuevo usuario',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {},
          ),
          const SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }
}
