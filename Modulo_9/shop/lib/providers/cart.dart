import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:shop/providers/product.dart';

//Responsavel por informa o item no carrinho
class CartItem {
  final String id;
  final String productId;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.productId,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}

//informa um Map com todos os itens do carrinho
class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {...this._items};
  }

  double get totalAmount {
    var total = 0.0;

    this._items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  //informa a quantidade de itens no carrinho
  int get itemsCount => this._items.length;

  void addItem(Product product) {
    //se o item já existir ele atualiza o item adicionando mais um item na quantidade
    if (this._items.containsKey(product.id)) {
      _items.update(
        product.id,
        (existingItem) {
          return CartItem(
            id: existingItem.id,
            productId: product.id,
            title: existingItem.title,
            quantity: existingItem.quantity + 1,
            price: existingItem.price,
          );
        },
      );
    }
    //se não tiver esse item no carrinho ele adiciona o item no carrinho
    else {
      this._items.putIfAbsent(
            product.id,
            () => CartItem(
              id: Random().nextDouble.toString(),
              productId: product.id,
              title: product.title,
              quantity: 1,
              price: product.price,
            ),
          );
    }

    notifyListeners();
  }

  void removeItem(String productId) {
    this._items.remove(productId);
    notifyListeners();
  }

  void clear() {
    this._items = {};
    notifyListeners();
  }
}
