import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/exceptions/http_exception.dart';
import 'package:shop/providers/product.dart';
import 'package:shop/utils/constants.dart';

class Products with ChangeNotifier {
  String _token;
  String _userId;

  Products([this._token, this._userId, this._items = const []]);

  //lista de produtos da loja
  List<Product> _items = [];
  //Lembrese de por .json no final da _baseUrl quando for utilizar ela
  final _baseUrl = '${Constants.BASE_API_URL}/products';

  Future<void> loadProducts() async {
    final response = await http.get("$_baseUrl.json?auth=$_token");
    Map<String, dynamic> data = json.decode(response.body);

    //consulta na API a lista de produtos favoritos do usuario
    final favResponse = await http.get(
        "${Constants.BASE_API_URL}userFavorites/$_userId.json?auth=$_token");

    //cria um Map com a lista de produtos favoritados do usuario
    final favMap = json.decode(favResponse.body);

    if (data != null) {
      //para evitar a duplicação de itens no app limpa a lista anterior
      this._items.clear();
      data.forEach((productId, productData) {
        //efetua o usuario não tiver uma lista de favorito ele retorna false
        final isFavorite = favMap == null ? false : favMap[productId] ?? false;

        this._items.add(
              Product(
                //o propio fire base (io) gera um codigo unico que pode ser usado como Id
                id: productId,
                title: productData['title'],
                description: productData['description'],
                price: productData['price'],
                imageUrl: productData['imageUrl'],
                isFavorite: isFavorite,
              ),
            );
      });
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
    var response = await http.post("$_baseUrl.json?auth=$_token",
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
  Future<void> updateProduct(Product product) async {
    if (product == null || product.id == null) {
      return;
    }

    final index = this._items.indexWhere((prod) => prod.id == product.id);

    if (index >= 0) {
      await http.patch(
        "$_baseUrl/${product.id}.json?auth=$_token",
        body: json.encode(
          {
            'title': product.title,
            'description': product.description,
            'price': product.price,
            'imageUrl': product.imageUrl,
          },
        ),
      );
      this._items[index] = product;
      notifyListeners();
    }
  }

  void deletedProduct(Product product, BuildContext context) async {
    final index = this._items.indexWhere((prod) => prod.id == product.id);

    if (index >= 0) {
      //ele paga primeiro o product dentro do sistema do App
      //caso de erro restaura o item depois de receber o statusCode
      //do WebServer
      this._items.remove(product);
      notifyListeners(); //atualiza a list do app

      final response =
          await http.delete("$_baseUrl/${product.id}.json?auth=$_token");

      if (response.statusCode >= 400) {
        //add o produto qua não pode ser cadastrado
        //de novo a lista do produto do usuario
        this._items.insert(index, product);
        notifyListeners(); //atualiza a list do app

        throw HttpException("Ocorreu um erro na exclusão do produto.");
      }
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
