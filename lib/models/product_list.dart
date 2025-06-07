import 'package:flutter/material.dart';
import 'package:semana6_7/data/dummy_data.dart';
import 'package:semana6_7/models/product.dart';

class ProductList with ChangeNotifier {
  List<Product> _items = dummy_products;

  List<Product> get items => [..._items];

  void addProduct(Product product){
    _items.add(product);
    notifyListeners();
  }
}