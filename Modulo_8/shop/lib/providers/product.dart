import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product(
      {this.id,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.imageUrl,
      this.isFavorite = false});

  void toggleFavorite() {
    //inverte o valor da var isFavorite
    this.isFavorite = !this.isFavorite;

    //informa ao observador sobre a mudança
    notifyListeners();
  }
}
