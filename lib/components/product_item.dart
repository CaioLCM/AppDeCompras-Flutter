import 'package:flutter/material.dart';
import 'package:semana6_7/models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  ProductItem({required this.product});
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: Image.network(product.imageUrl, fit: BoxFit.cover),
        footer: GridTileBar(
          leading: IconButton(onPressed: null, icon: Icon(Icons.favorite)),
          backgroundColor: Colors.black87,
          title: Text(product.title, textAlign: TextAlign.center,),
          trailing: IconButton(onPressed: null, icon: Icon(Icons.shopping_cart)),
        ),
        ),
    );
  }
}
