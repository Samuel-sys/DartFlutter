import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/order.dart';
import 'package:shop/widgets/app_drawer.dart';
import 'package:shop/widgets/order_widget.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  //responsável por informa a Page quando a List de Orders estive carregado
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    //carrega a lista de Objetos do tipo Orders que informa os pedidos efetuados
    Provider.of<Orders>(context, listen: false)
        .loadOrders() //método responsável por carregar os dados da API
        .then((_) => setState(() {
              this._isLoading = false; //avisa que os dados já foram carregados
            }));
  }

  @override
  Widget build(BuildContext context) {
    //Provider de conexão com o WebServer (API)
    final Orders orders = Provider.of(context);

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Meus Pedidos'),
      ),

      //body
      body:
          //esta carregando a lista de produtos ainda ??
          this._isLoading
              ? Center(child: CircularProgressIndicator())
              : RefreshIndicator(
                  //caso ele ative o onRefreshe ele faz
                  //uma atualização nos dados do sistema
                  onRefresh: () => orders.loadOrders(),

                  //lista de Pedidos feitos
                  child: ListView.builder(
                    itemCount: orders.itemsCount,
                    itemBuilder: (ctx, i) {
                      return OrderWidget(orders.items[i]);
                    },
                  ),
                ),
    );
  }
}
