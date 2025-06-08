import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:semana6_7/models/cart.dart';
import 'package:semana6_7/models/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  const CartItemWidget({required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      confirmDismiss: (_) {
        return showDialog<bool>(
          context: context,
          builder:
              (ctx) => AlertDialog(
                title: Text("Tem certeza?"),
                content: Text("Quer remover o item do carrinho?"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop(true);
                    },
                    child: Text("Sim"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop(false);
                    },
                    child: Text("Não"),
                  ),
                ],
              ),
        );
      },
      onDismissed: (_) {
        Provider.of<Cart>(
          context,
          listen: false,
        ).removeItem(cartItem.productId);
      },
      key: ValueKey(cartItem.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).colorScheme.error,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Icon(Icons.delete, color: Colors.white, size: 40),
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: FittedBox(child: Text('${cartItem.price}')),
            ),
          ),
          title: Text(cartItem.name),
          subtitle: Text("Total: R\$ ${cartItem.price * cartItem.quantity}"),
          trailing: Text("${cartItem.quantity}x"),
        ),
      ),
    );
  }
}
