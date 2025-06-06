import 'package:flutter/material.dart';
import 'package:semana6_7/models/product.dart';

class ProductDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context)?.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(product.title, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
