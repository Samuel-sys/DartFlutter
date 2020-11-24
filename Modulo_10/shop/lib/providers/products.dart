import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/data/dummy_data.dart';
import 'package:shop/providers/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = DUMMY_PRODUCTS;
  final String _url =
      'https://flutter-shop-alencar.firebaseio.com/products.json';

  Future<void> loadProducts() async {
    final response = await http.get(this._url);
    Map<String, dynamic> data = json.decode(response.body);

    if (data != null) {
      //para evitar a duplicação de itens no app limpa a lista anterior
      this._items.clear();
      data.forEach(
        (productId, productData) {
          this._items.add(
                Product(
                  //o propio fire base (io) gera um codigo unico que pode ser usado como Id
                  id: productId,
                  title: productData['title'],
                  description: productData['description'],
                  price: productData['price'],
                  imageUrl: productData['imageUrl'],
                  isFavorite: productData['isFavorite'],
                ),
              );
        },
      );
      notifyListeners();
    }
  }

  //todos os items
  List<Product> get items => [...this._items];

  int get itemsCount => this._items.length;

  //items marcados como favoritos
  List<Product> get favoriteItems =>
      this._items.where((prod) => prod.isFavorite).toList();

  Future<Null> addProduct(Product newProduct) async {
    //o await e usado para fazer com que o sistema espere o resultado
    //do Future e depositar ele na variavel para depois continuar o codigo
    var response = await http.post(_url,
        body: json.encode(
          {
            'title': newProduct.title,
            'description': newProduct.description,
            'price': newProduct.price,
            'imageUrl': newProduct.imageUrl,
            'isFavorite': newProduct.isFavorite
          },
        ));
    this._items.add(
          Product(
            //o propio fire base (io) gera um codigo unico que pode ser usado como Id
            id: json.decode(response.body)['name'],
            title: newProduct.title,
            description: newProduct.description,
            price: newProduct.price,
            imageUrl: newProduct.imageUrl,
          ),
        );
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
      this._items.removeWhere((prod) => prod.id == product.id);
      notifyListeners();
    }
    //caso não encontre o index informa o usuario
    else {
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
            ]),
      );
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
