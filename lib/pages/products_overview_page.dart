import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:semana6_7/components/badgee.dart';
import 'package:semana6_7/components/product_grid.dart';
import 'package:semana6_7/models/cart.dart';
import 'package:semana6_7/models/product_list.dart';
import 'package:semana6_7/utils/app_routes.dart';

enum FilterOptions { Favorite, All }

class ProductsOverviewPage extends StatefulWidget {
  @override
  State<ProductsOverviewPage> createState() => _ProductsOverviewPageState();
}

class _ProductsOverviewPageState extends State<ProductsOverviewPage> {
  bool _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Center(
          child: Text("Minha loja", style: TextStyle(color: Colors.white)),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder:
                (_) => [
                  PopupMenuItem(
                    value: FilterOptions.Favorite,
                    child: Text("Somente favoritos"),
                  ),
                  PopupMenuItem(value: FilterOptions.All, child: Text("Todos")),
                ],
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorite) {
                  _showFavoriteOnly = true;
                } else {
                  _showFavoriteOnly = false;
                }
              });
            },
          ),
          Consumer<Cart>(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.CART);
              },
              icon: Icon(Icons.shopping_cart),
            ),
            builder:
                (ctx, cart, child) =>
                    Badgee(value: cart.itemsCount.toString(), child: child!),
          ),
        ],
      ),
      body: ProductGrid(_showFavoriteOnly),
    );
  }
}
