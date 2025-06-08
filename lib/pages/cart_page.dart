import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:semana6_7/components/cart_item.dart';
import 'package:semana6_7/models/cart.dart';
import 'package:semana6_7/models/order_list.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of<Cart>(context);
    final items = cart.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Carrinho", style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(25),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total", style: TextStyle(fontSize: 20)),
                  Chip(
                    backgroundColor: Theme.of(context).primaryColor,
                    label: Text(
                      "R\$${cart.totalAmount.toStringAsFixed(2)}",
                      style: TextStyle(
                        color:
                            Theme.of(
                              context,
                            ).primaryTextTheme.headlineMedium?.color,
                      ),
                    ),
                  ),
                  Spacer(),
                  TextButton(onPressed: (){
                    Provider.of<OrdersList>(context, listen: false).addOrder(cart);
                    cart.clear();
                  }, child: Text("Comprar"), style: TextButton.styleFrom(textStyle: TextStyle(color: Theme.of(context).primaryColor)),)
                ],
              ),
            ),
          ),
          Expanded(child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (ctx, i) => CartItemWidget(cartItem: items[i])))
        ],
      ),
    );
  }
}
