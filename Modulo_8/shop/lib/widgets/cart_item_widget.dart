import 'package:flutter/material.dart';
import 'package:shop/providers/cart.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;

  const CartItemWidget(this.cartItem);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListTile(
          //Circulo com o preço da unidade do produto
          leading: CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: FittedBox(
                child: Text("${this.cartItem.price}"),
              ),
            ),
          ),

          //nome do produto
          title: Text(cartItem.title),

          //quantidade de produtos
          trailing: Text("${cartItem.quantity}x"),

          //valor total a ser pago
          subtitle: Text("R\$${this.cartItem.price * this.cartItem.quantity}"),
        ),
      ),
    );
  }
}
