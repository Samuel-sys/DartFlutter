import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../exceptions/firebase_exceptions.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;

  //informa se o usuario esta autenticado no sistema
  bool get isAuth {
    return token != null;
  }

  String get token {
    if (this._token != null &&
        this._expiryDate != null &&
        this._expiryDate.isAfter(DateTime.now())) {
      return this._token;
    } else {
      return null;
    }
  }

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    //chave da API da Web
    const keyAPI = 'AIzaSyAYihlzFgJ7K0OCfgedwyTMixjpwjw3KGQ';

    //urL de conexão e autenticação de login com a API
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=$keyAPI';

    //efetua a consulta na API do usuario informado
    final response = await http.post(
      url,
      body: json.encode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
    );

    //registra os dados retornado da API
    final responseBody = json.decode(response.body);

    //se tiver um erro informa ao APP o motivo do erro atraveis do AuthException
    if (responseBody['error'] != null) {
      //informa ao App qual erro ocorreu e informa qual erro foi criado
      //atraves do catalogo do sistema
      throw AuthException(responseBody['error']['message']);
    } else {
      //cadastra o token do usuario
      this._token = responseBody['idToken'];

      //informa o momento em que esse token não sera mais valido
      this._expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(responseBody['expiresIn']),
        ),
      );
      //notifica o app da mundansa nos dados do sistema
      notifyListeners();
    }

    //retorna o resultado para a API
    return Future.value();
  }

  //cadastra um novo Email no sistema
  Future<void> signup(String email, String password) async {
    return this._authenticate(email, password, 'signUp');
  }

  //Efetua o login de um usuario
  Future<void> login(String email, String password) async {
    return this._authenticate(email, password, 'signInWithPassword');
  }
}
