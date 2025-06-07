import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:semana6_7/components/product_grid.dart';
import 'package:semana6_7/models/product_list.dart';

enum FilterOptions {
  Favorite,
  All,
}
class ProductsOverviewPage extends StatelessWidget {
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
                  PopupMenuItem(value: FilterOptions.Favorite, child: Text("Somente favoritos")),
                  PopupMenuItem(value: FilterOptions.All, child: Text("Todos")),
                ],
                onSelected: (FilterOptions selectedValue){
                  if(selectedValue == FilterOptions.Favorite){
                    provider.showFavoriteOnly();
                  } else{
                    provider.showAll();
                  }
                },
          ),
        ],
      ),
      body: ProductGrid(),
    );
  }
}
