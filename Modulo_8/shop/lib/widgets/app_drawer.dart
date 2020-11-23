import 'package:flutter/material.dart';
import 'package:shop/utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  //Lista de paginas do App com os dados necessários para o ListTile
  final List<Map<String, dynamic>> screens = [
    {
      'screen': AppRoutes.HOME,
      'icon': Icons.shop,
      'title': 'Loja',
    },
    {
      'screen': AppRoutes.ORDERS,
      'icon': Icons.payment,
      'title': 'Pedidos',
    },
    {
      'screen': AppRoutes.PRODUCTS,
      'icon': Icons.edit,
      'title': 'Gerenciar produtos',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text("Bem vindo usuário"),
          ),

          //Lista de paginas do Drawer
          ...screens.map(
            (screens) => Column(
              children: [
                Divider(),
                ListTile(
                  leading: Icon(screens["icon"]),
                  title: Text(screens['title']),
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(screens['screen']);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
