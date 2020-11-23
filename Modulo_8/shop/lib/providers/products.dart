import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/providers/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = DUMMY_PRODUCTS;

  //todos os items
  List<Product> get items => [...this._items];

  int get itemsCount => this._items.length;

  //items marcados como favoritos
  List<Product> get favoriteItems =>
      this._items.where((prod) => prod.isFavorite).toList();

  void addProduct(Product newProduct) {
    this._items.add(Product(
          id: Random().nextDouble().toString(),
          title: newProduct.title,
          description: newProduct.description,
          price: newProduct.price,
          imageUrl: newProduct.imageUrl,
        ));

    //notifica todos os intereçados que a lista de produtos foi alterado
    notifyListeners();
  }

  //atualiza um produto se caso não encontrar o produto a ser atualizado
  //retorna um valor false
  void updateProduct(Product product) {
    if (product == null || product.id == null) {
      return;
    }

    final index = this._items.indexWhere((prod) => prod.id == product.id);

    if (index >= 0) {
      this._items[index] = product;
      notifyListeners();
    }
  }

  void deletedProduct(Product product, BuildContext context) {
    final index = this._items.indexWhere((prod) => prod.id == product.id);

    if (index >= 0) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Tem certeza?"),
          content: Text(
            "Tem certeza que você quer deletar " +
                "o produto:\n ${product.title}?",
            textAlign: TextAlign.center,
          ),
          actions: [
            FlatButton(
              child: Text("SIM"),
              onPressed: () {
                this._items.removeWhere((prod) => prod.id == product.id);
                notifyListeners();
                //fecha o AlertDialog
                Navigator.of(ctx).pop();
              },
            ),
            FlatButton(
              child: Text("NÃO"),
              onPressed: () => Navigator.of(ctx).pop(),
            ),
          ],
        ),
      );
    } else {
      showDialog(
          context: context,
          child: AlertDialog(
            content:
                Text("Erro ao localizar o produto no sistema:\nindex:$index"),
            actions: [
              FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Ok"),
              )
            ],
          ));
    }
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
