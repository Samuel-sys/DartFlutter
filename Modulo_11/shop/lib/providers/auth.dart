import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../exceptions/firebase_exceptions.dart';

class Auth with ChangeNotifier {
  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyAYihlzFgJ7K0OCfgedwyTMixjpwjw3KGQ';
    final response = await http.post(
      url,
      body: json.encode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
    );

    var responseBody = json.decode(response.body);
    if (responseBody['error'] != null) {
      throw AuthException(responseBody['error']['message']);
    }

    return Future.value();
  }

  Future<void> signup(String email, String password) async {
    return this._authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return this._authenticate(email, password, 'signInWithPassword');
  }
}