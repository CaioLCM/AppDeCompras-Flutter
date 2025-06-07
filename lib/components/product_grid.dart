import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:semana6_7/components/product_item.dart';
import 'package:semana6_7/models/product.dart';
import 'package:semana6_7/models/product_list.dart';

class ProductGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  final provider = Provider.of<ProductList>(context);
  final List<Product> loadedProducts = provider.items;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        itemCount: loadedProducts.length,
        itemBuilder: (ctx, i) => ProductItem(product: loadedProducts[i]),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
        ),
      ),
    );
  }
}