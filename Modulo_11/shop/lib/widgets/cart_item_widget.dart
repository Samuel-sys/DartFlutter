import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;

  const CartItemWidget(this.cartItem);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cartItem.id), //chave unica para cada item do carrinho
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        Provider.of<Cart>(context, listen: false)
            .removeItem(cartItem.productId);
      },

      //confirma se o usuario deseja mesmo deletar o item do carrinho
      confirmDismiss: (_) {
        return showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: Text("Você tem Certeza?"),
              content: Text("Quer remover o item do carrinho ?"),
              actions: <Widget>[
                //NÃO
                FlatButton(
                  onPressed: () => Navigator.of(ctx).pop(false),
                  child: Text("Não"),
                ),

                //SIM
                FlatButton(
                  onPressed: () => Navigator.of(ctx).pop(true),
                  child: Text("Sim"),
                ),
              ],
            );
          },
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            //Circulo com o preço da unidade do produto
            leading: CircleAvatar(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: FittedBox(
                  child: Text("${this.cartItem.price.toStringAsFixed(2)}"),
                ),
              ),
            ),

            //nome do produto
            title: Text(cartItem.title),

            //quantidade de produtos
            trailing: Text("${cartItem.quantity}x"),

            //valor total a ser pago
            subtitle: Text(
                "R\$${(this.cartItem.price * this.cartItem.quantity).toStringAsFixed(2)}"),
          ),
        ),
      ),
    );
  }
}
