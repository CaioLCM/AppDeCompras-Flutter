import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:semana6_7/components/product_grid_item.dart';
import 'package:semana6_7/models/product.dart';
import 'package:semana6_7/models/product_list.dart';

class ProductGrid extends StatelessWidget {

  final bool showFavoriteOnly;

  ProductGrid(this.showFavoriteOnly);

  @override
  Widget build(BuildContext context) {
  final provider = Provider.of<ProductList>(context);
  final List<Product> loadedProducts = showFavoriteOnly? provider.favoriteItems : provider.items;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        itemCount: loadedProducts.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: loadedProducts[i],
          child: ProductGridItem(),
        ),
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