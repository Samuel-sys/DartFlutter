import 'package:flutter/cupertino.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/providers/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = DUMMY_PRODUCTS;

  //todos os items
  List<Product> get items => [...this._items];

  //items marcados como favoritos
  List<Product> get favoriteItems =>
      this._items.where((prod) => prod.isFavorite).toList();

  void addProduct(Product product) {
    this._items.add(product);

    //notifica todos os intereçados que a lista de produtos foi alterado
    notifyListeners();
  }
}
// bool _shoFavoriteOnly = false;

// List<Product> get items {
//   if (this._shoFavoriteOnly) {
//     return this._items.where((prod) => prod.isFavorite).toList();
//   }

//   return [...this._items];
// }

// void showFavoriteOnly() {
//   this._shoFavoriteOnly = true;
//   notifyListeners();
// }

// void showAll() {
//   this._shoFavoriteOnly = false;
//   notifyListeners();
// }
