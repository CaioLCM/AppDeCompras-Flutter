import 'package:flutter/material.dart';
import 'package:semana6_7/models/cart.dart';
import 'package:semana6_7/models/order_list.dart';
import 'package:semana6_7/models/product_list.dart';
import 'package:semana6_7/pages/cart_page.dart';
import 'package:semana6_7/pages/counter_page.dart';
import 'package:semana6_7/pages/orders_page.dart';
import 'package:semana6_7/pages/product_detail_page.dart';
import 'package:semana6_7/pages/product_form_page.dart';
import 'package:semana6_7/pages/products_page.dart';
import 'package:semana6_7/pages/products_overview_page.dart';
import 'package:semana6_7/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductList()),
        ChangeNotifierProvider(create: (_) => Cart()),
        ChangeNotifierProvider(create: (_) => OrdersList())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue,
            accentColor: Colors.deepOrange,
          ),
          fontFamily: 'Lato'
        ),
        home: ProductsOverviewPage(),
        routes: {
          AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailPage(),
          AppRoutes.CART: (ctx) => CartPage(),
          AppRoutes.ORDERS: (ctx) => OrdersPage(),
          AppRoutes.PRODUCTS: (ctx) => ProductsPage(),
          AppRoutes.PRODUCT_FORM: (ctx) => ProductFormPage()
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

