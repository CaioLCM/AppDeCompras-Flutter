import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:semana6_7/models/order.dart';

class OrderWidget extends StatelessWidget {
  final Order order;
  const OrderWidget({required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("R\$ ${order.total.toStringAsFixed(2)}"),
        subtitle: Text(
          DateFormat('dd/MM/yyyy hh:mm').format(order.date)
        ),
        trailing: IconButton(onPressed: (){}, icon: Icon(Icons.expand_more)),
      ),
    );
  }
}