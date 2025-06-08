import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:semana6_7/components/app_drawer.dart';
import 'package:semana6_7/components/product_item.dart';
import 'package:semana6_7/models/product_list.dart';
import 'package:semana6_7/utils/app_routes.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductList products = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Gerenciar Produtos",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PRODUCT_FORM);
            },
            icon: Icon(Icons.add),
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: products.itemsCount,
          itemBuilder:
              (ctx, i) => Column(
                children: [ProductItem(product: products.items[i]), Divider()],
              ),
        ),
      ),
    );
  }
}
