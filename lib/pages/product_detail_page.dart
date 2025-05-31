import 'package:flutter/material.dart';
import 'package:semana6_7/models/product.dart';

class ProductDetailPage extends StatelessWidget {
  
  final Product product;
  ProductDetailPage({
    required this.product
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(product.title, style: TextStyle(color: Colors.white),),
        
      ),
    );
  }
}