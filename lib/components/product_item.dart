import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:semana6_7/models/product.dart';
import 'package:semana6_7/models/product_list.dart';
import 'package:semana6_7/utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({
    required this.product
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(product.name),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(onPressed: (){
              Navigator.of(context).pushNamed(AppRoutes.PRODUCT_FORM, arguments: product);
            }, icon: Icon(Icons.edit), color: Theme.of(context).primaryColor,),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text("Tem certeza?"),
                    content: Text("Tem certeza de que deseja remover o produto?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Provider.of<ProductList>(context, listen: false).removeProduct(product);
                          Navigator.of(ctx).pop();
                        },
                        child: Text("Sim"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Text("Não"),
                      ),
                    ],
                  ),
                );
              },
              icon: Icon(Icons.delete),
              color: Theme.of(context).colorScheme.error,
            )
          ],
        ),
      ),
    );
  }
}