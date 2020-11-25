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

  //entrega uma copia da lista de pedidos feito
  List<Order> get items => [...this._items];

  //carrega os dados do cliente
  Future<void> loadOrders() async {
    //variável de controle onde os dados são manipulados
    List<Order> loadedItems = [];

    //recebe os dados do WebServer (API)
    final response = await http.get("$_baseUrl.json");

    //converte os dados entregues pela API (arquivo json) para um Map<String, dynamic>
    final Map<String, dynamic> data = json.decode(response.body);

    //se não tiver nenhum retorno da API ele não execulta esse bloco de comando
    if (data != null) {
      //loop de repetição para fazer cada item do Map com os dados dos pedidos
      //se tornar um Objeto Order para ser adicionado no List loadedItems
      data.forEach(
        //(Chave, dado)
        (orderId, orderData) {
          //adiciona cada dado no loadedItems para depois se entregue ao this._items
          loadedItems.add(
            Order(
              id: orderId,
              //Id do Pedido

              total: orderData['total'],
              //valor total do pedido

              date: DateTime.parse(orderData['date']),
              //dia do pedido

              //Lista de produtos comprados
              products:
                  //converte em uma List<dynamic>
                  (orderData['products'] as List<dynamic>)
                      .map(
                        //converte o dados para o Objeto CartItem
                        (items) => CartItem(
                          //Id do item no carrinho
                          id: items['id'],

                          //Id do produto comprado
                          productId: items['productId'],

                          //nome do produto
                          title: items['title'],

                          //quantidade que foi comprada desse mesmo produto
                          quantity: items['quantity'],

                          //preço do produto
                          price: items['price'],
                        ),
                      )
                      .toList(), //converte para um List<CartItem>
            ),
          );
        },
      );
    }
    //informa os dados entregues da API para o List<Order> _items
    this._items = loadedItems.reversed.toList();

    //notifica ao App a alterção feita
    notifyListeners();
  }

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
