import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/order.dart';
import 'package:shop/widgets/cart_item_widget.dart';

class CartScreeen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of<Cart>(context);
    final cartItem = cart.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Carrinho"),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(25),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //label
                  Text(
                    "Total",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: 20),

                  //total
                  Chip(
                    label: Text(
                      "R\$${cart.totalAmount.toStringAsFixed(2)}",
                      style: TextStyle(
                        color:
                            Theme.of(context).primaryTextTheme.headline6.color,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),

                  //Preenche um espaço maior para ter um distanciamento do total
                  Spacer(),

                  //evento comprar
                  OrderButton(cart: cart)
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: cart.itemsCount,
              itemBuilder: (context, index) {
                //cria um ListTile para cada item colocado no carrinho
                return CartItemWidget(cartItem[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}

class OrderButton extends StatefulWidget {
  const OrderButton({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  _OrderButtonState createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return this._isLoading
        ? CircularProgressIndicator()
        : FlatButton(
            onPressed:
                //so ativa o botão se tiver itens no carrinho
                widget.cart.itemsCount == 0
                    ? null
                    : () async {
                        setState(() => this._isLoading = !this._isLoading);

                        await Provider.of<Orders>(context, listen: false)
                            .addOrder(widget.cart);

                        setState(() => this._isLoading = !this._isLoading);

                        widget.cart.clear();
                      },
            child: Text("COMPRAR"),
            textColor: Theme.of(context).primaryColor,
          );
  }
}
