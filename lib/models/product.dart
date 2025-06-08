import 'package:flutter/widgets.dart';

class Product with ChangeNotifier {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;
  bool imageIsHiden;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
    this.imageIsHiden = false
  });

  void toggleFavorite(){
    isFavorite = !isFavorite;
    notifyListeners();
  }

  void toggleHiddenImage(){
    imageIsHiden = !imageIsHiden;
    notifyListeners();
  }
}