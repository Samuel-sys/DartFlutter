import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shop/providers/cart.dart';

class Order {
  final String id;
  final double total;
  final List<CartItem> products;
  final DateTime date;

  Order({
    this.id,
    this.total,
    this.products,
    this.date,
  });
}

class Orders with ChangeNotifier {
  final _baseUrl = 'https://flutter-shop-alencar.firebaseio.com/orders';
  List<Order> _items = [];

  List<Order> get items => [...this._items];

  int get itemsCount => this._items.length;

  Future<void> addOrder(Cart cart) async {
    var date = DateTime.now();

    var response = await http.post(
      "$_baseUrl.json",
      body: json.encode(
        {
          'total': cart.totalAmount,
          'date': date.toIso8601String(), //converte em um formato obrigatorio
          'products': cart.items.values
              .map(
                (cartItem) => {
                  'id': cartItem.id,
                  'productId': cartItem.productId,
                  'title': cartItem.title,
                  'quantity': cartItem.quantity,
                  'price': cartItem.price,
                },
              )
              .toList(),
        },
      ),
    );

    this._items.insert(
        0, //colocado sempre no topo da lista de orders
        Order(
          id: json.decode(response.body)['name'],
          total: cart.totalAmount,
          date: date,
          products: cart.items.values.toList(),
        ));
    notifyListeners();
  }
}
