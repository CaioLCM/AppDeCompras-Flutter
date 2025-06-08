import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:semana6_7/components/app_drawer.dart';
import 'package:semana6_7/components/order.dart';
import 'package:semana6_7/models/order_list.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final OrdersList orders = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Meus pedidos", style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orders.itemsCount,
        itemBuilder: (ctx, i) => OrderWidget(order: orders.items[i])
      ),
    );
  }
}