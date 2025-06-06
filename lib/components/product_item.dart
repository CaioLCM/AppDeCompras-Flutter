import 'package:flutter/material.dart';
import 'package:semana6_7/models/product.dart';
import 'package:semana6_7/pages/product_detail_page.dart';
import 'package:semana6_7/utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  ProductItem({required this.product});
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          leading: IconButton(onPressed: (){}, icon: Icon(Icons.favorite), color: Theme.of(context).colorScheme.secondary,),
          backgroundColor: Colors.black87,
          title: Text(product.title, textAlign: TextAlign.center,),
          trailing: IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart), color: Theme.of(context).colorScheme.secondary),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(AppRoutes.PRODUCT_DETAIL,
            arguments: product);
          },
          child: Image.network(product.imageUrl, fit: BoxFit.cover)),
        ),
    );
  }
}
