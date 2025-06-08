import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:semana6_7/components/app_drawer.dart';
import 'package:semana6_7/components/badgee.dart';
import 'package:semana6_7/components/product_grid.dart';
import 'package:semana6_7/models/cart.dart';
import 'package:semana6_7/models/product_list.dart';
import 'package:semana6_7/utils/app_routes.dart';

enum FilterOptions { Favorite, All }

class CategoriesPage extends StatefulWidget {
  @override
  State<CategoriesPage> createState() => _ProductsOverviewPageState(); 
}

class _ProductsOverviewPageState extends State<CategoriesPage> {
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
      drawer: AppDrawer(),
    );
  }
}
