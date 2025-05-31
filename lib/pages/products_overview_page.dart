import 'package:flutter/material.dart';
import 'package:semana6_7/models/product.dart';
import 'package:semana6_7/data/dummy_data.dart';

class ProductsOverviewPage extends StatelessWidget {
  final List<Product> loadedProducts = dummy_products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Center(child: Text("Minha loja", style: TextStyle(color: Colors.white),)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: loadedProducts.length,
          itemBuilder: (ctx, i) => Text(loadedProducts[i].title),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3/2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10
          )),
      ),
    );
  }
}