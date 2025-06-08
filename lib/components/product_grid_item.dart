import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:semana6_7/models/cart.dart';
import 'package:semana6_7/models/product.dart';
import 'package:semana6_7/pages/product_detail_page.dart';
import 'package:semana6_7/utils/app_routes.dart';

class ProductGridItem extends StatelessWidget {
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          leading: Consumer<Product>(
            builder:
                (context, value, _) => IconButton(
                  onPressed: () {
                    product.toggleFavorite();
                  },
                  icon: Icon(
                    product.isFavorite ? Icons.favorite : Icons.favorite_border,
                  ),
                  color: Theme.of(context).colorScheme.secondary,
                ),
          ),
          backgroundColor: Colors.black87,
          title: Text(product.name, textAlign: TextAlign.center),
          trailing: IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Produto adicionado com sucesso!"),
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(
                    label: 'DESFAZER', 
                    onPressed: (){
                      cart.removeSingleItem(product.id);
                    }),
                  )
              );
              cart.addItem(product);
            },
            icon: Icon(Icons.shopping_cart),
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(
              context,
            ).pushNamed(AppRoutes.PRODUCT_DETAIL, arguments: product);
          },
          child: Image.network(product.imageUrl, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
