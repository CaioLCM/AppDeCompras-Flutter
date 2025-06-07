import 'package:flutter/material.dart';
import 'package:semana6_7/components/product_grid.dart';
class ProductsOverviewPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Center(child: Text("Minha loja", style: TextStyle(color: Colors.white),)),
      ),
      body: 
      ProductGrid()
    );
  }
}
