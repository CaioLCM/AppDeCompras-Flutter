import 'package:flutter/material.dart';
import 'package:semana6_7/pages/products_overview_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
        primarySwatch: Colors.blue
      ),
      home: ProductsOverviewPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

