import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shop/exceptions/http_exception.dart';

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

  final _baseUrl = 'https://flutter-shop-alencar.firebaseio.com/products';
  /*
   * post = Insert (cadatrar)
   * patch = Update (alterar, lembre de passar o id como parametro) 
   * get = Select (consulta)
   * delete = Delete (deleta, lembre de passar o id como parametro)
   */

  Future<void> toggleFavorite() async {
    //inverte o valor da var isFavorite
    this.isFavorite = !this.isFavorite;

    //informa ao App sobre a mudança do item
    notifyListeners();

    try {
      //altera o isFavorite no webServer (API)
      final response = await http
          .patch(
            "$_baseUrl/$id.json",
            body: json.encode(
              {
                'isFavorite': this.isFavorite
              }, //altera apenas o parametro isFavorite
            ),
          )
          .catchError(
            (erro) => throw HttpException("Erro de conecxão com o servidor"),
          );

      //caso tenha algum erro ele informa ao usuario
      if (response.statusCode >= 400) {
        //inverte o valor do isFavorite no App e informa a mudança do item ao App
        this.isFavorite = !this.isFavorite;
        notifyListeners();

        //envia a mensagem de Exception conforme a ação feita
        throw HttpException("Erro no processo de " +
            "${!this.isFavorite ? "Favoritar" : "desfavoritar"} o seu item. \n" +
            "Erro :${response.statusCode}");
      }
    } catch (erro) {
      //ultimo caso se ocorre um erro que e inesperado pelo sistema
      this.isFavorite = !this.isFavorite;
      notifyListeners();

      throw HttpException("Erro inesperado");
    }
  }
}
