import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/order.dart';
import 'package:shop/widgets/app_drawer.dart';
import 'package:shop/widgets/order_widget.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Orders orders = Provider.of(context);

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Meus Pedidos'),
      ),

      //body
      body: ListView.builder(
        itemCount: orders.itemsCount,
        itemBuilder: (ctx, i) {
          return OrderWidget(orders.items[i]);
        },
      ),
    );
  }
}
