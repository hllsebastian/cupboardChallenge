import 'package:cupboard/pages/addproducts_page.dart';
import 'package:cupboard/pages/categories_page.dart';
import 'package:cupboard/pages/home_page.dart';
import 'package:cupboard/pages/products_page.dart';
import 'package:cupboard/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoriesService()),
      ], 
      child: MyCupboard(),
    );
  }
}

class MyCupboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/',
      routes:  {
        '/'         : (_) => const HomePage(),
        'addProduct': (_) => AddProductsPage(),
        'categories': (_) => const CategoriesPage(),
        'products'  : (_) => const ProducstPage(),
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