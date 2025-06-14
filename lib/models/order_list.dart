import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:semana6_7/models/cart.dart';
import 'package:semana6_7/models/order.dart';

class OrdersList with ChangeNotifier{
  List<Order> _items = [];
  List<Order> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  void addOrder(Cart cart) {
    _items.insert(0, 
    Order(id: Random().nextDouble().toString(), 
    total: cart.totalAmount, 
    products: cart.items.values.toList(), 
    date: DateTime.now())
    );

    notifyListeners();
  }
}