import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop/providers/order.dart';

class OrderWidget extends StatefulWidget {
  final Order order;

  const OrderWidget(this.order);

  @override
  _OrderWidgetState createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text("R\$${widget.order.total.toStringAsFixed(2)}"),
            subtitle:
                Text(DateFormat('dd MMM yyyy hh:mm').format(widget.order.date)),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
              onPressed: () {
                setState(() => _expanded = !_expanded);
              },
            ),
          ),

          //lista de produtos comprados
          if (_expanded)
            Container(
              //tamanho do container conforme a quantidade de produtos no carrinho
              height: widget.order.products.length * 25.0 + 10,
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 4,
              ),
              child: ListView(
                children:
                    //lista de produtos compradas
                    widget.order.products.map((product) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    //apresenta os dados basicos do produto
                    children: [
                      Text(
                        product.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${product.quantity}x R\$ ${product.price.toStringAsFixed(2)}",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            )
        ],
      ),
    );
  }
}
