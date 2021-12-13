import 'dart:io';
import 'package:cupboard/pages/form_pages/trade_mark_form.dart';
import 'package:cupboard/pages/form_pages/category_form.dart';
import 'package:cupboard/pages/marcas.dart';
import 'package:cupboard/services/categories_service.dart';
import 'package:cupboard/services/trademark_service.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:cupboard/pages/addproducts_page.dart';
import 'package:cupboard/pages/trademarks_page.dart';
import 'package:cupboard/pages/categories_page.dart';
import 'package:cupboard/pages/home_page.dart';
import 'package:cupboard/pages/login_page.dart';
import 'package:cupboard/pages/products_page.dart';
import 'package:cupboard/services/auth_service.dart';



void main(){
  // ignore: prefer_const_constructors
  runApp(AppState());
  HttpOverrides.global = MyHttpOverrides(); // Para conectar de manera local con la API
} 

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}


class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService(), ),
        ChangeNotifierProvider(create: (_) => TrademarkService(), ),
        ChangeNotifierProvider(create: (_) => CategoriesService(), ),
      ],
      child: const MyCupboard()
    );
  }
}

class MyCupboard extends StatelessWidget {
  const MyCupboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'login',
      routes:  {
        '/'          : (_) => const HomePage(),
        'addBrand'   : (_) => const TradeMarkForm(),
        'addCategory': (_) => const FormCategory(),
        'addProduct' : (_) => const AddProductsPage(),
        'brands'     : (_) => const TrademarksPage(),
        'categories' : (_) => const CategoriesPage(),
        'login'      : (_) => const LoginPage(),
        'products'   : (_) => const ProductsPage(),
        'marcas'     : (_) => const Marcas(),
      },
      theme:  ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.purple
        ),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.purple) 
      ),
    );
  }
}

 