import 'package:flutter/material.dart';
import 'package:semana6_7/pages/counter_page.dart';
import 'package:semana6_7/pages/product_detail_page.dart';
import 'package:semana6_7/pages/products_overview_page.dart';
import 'package:semana6_7/utils/app_routes.dart';

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
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
        ),
        fontFamily: 'Lato'
      ),
      home: ProductsOverviewPage(),
      routes: {
        AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailPage()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

