import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/order.dart';
import 'package:shop/widgets/app_drawer.dart';
import 'package:shop/widgets/order_widget.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Meus Pedidos'),
      ),

      //body
      body: FutureBuilder(
        //ele monitora esse evento Future
        future: Provider.of<Orders>(context, listen: false).loadOrders(),
        builder: (ctx, snapshot) {
          //se ele estiver carregando os dados ele executa esse bloco de comandos
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          //Caso ocorra algum erro ele executa esse bloco de comandos
          else if (snapshot.error != null) {
            return Center(
                child: Text("Ocoreu um erro ao processar os dados..."));
          }

          //quando tiver carregado a tela ele carrega esse bloco de comandos
          else {
            return
                //caso aconteça alguma alteração no sistema ele atualiza apenas essa parte na page
                Consumer<Orders>(
              builder: (context, orders, child) {
                return RefreshIndicator(
                  //metodo para atualizar os dados do App com o da API
                  onRefresh: () => orders.loadOrders(),

                  //lista de pedidos efetuados
                  child: ListView.builder(
                    itemCount: orders.itemsCount,
                    itemBuilder: (ctx, i) => OrderWidget(orders.items[i]),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
