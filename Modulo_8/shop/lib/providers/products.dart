import 'package:flutter/cupertino.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/models/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = DUMMY_PRODUCTS;

  List<Product> get items => [...this._items];

  void addProduct(Product product) {
    this._items.add(product);

    //notifica todos os intereçados que a lista de produtos foi alterado
    notifyListeners();
  }
}
