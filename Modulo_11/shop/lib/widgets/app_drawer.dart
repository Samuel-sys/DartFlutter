import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/auth.dart';
import 'package:shop/utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  //Lista de paginas do App com os dados necessários para o ListTile
  final List<Map<String, dynamic>> screens = [
    {
      'screen': AppRoutes.AUTH_HOME,
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
                ListTile(
                  leading: Icon(screens["icon"]),
                  title: Text(screens['title']),
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(screens['screen']);
                  },
                ),
                Divider(),
              ],
            ),
          ),

          //Logout
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sair'),
            onTap: () {
              //Limpa os dados do usuario do App (token, userId e expiryDate)
              Provider.of<Auth>(context, listen: false).logout();

              //se tiver em uma pagina que não seja a Home ele envia para lá
              Navigator.of(context).pushReplacementNamed(AppRoutes.AUTH_HOME);
            },
          ),

          Divider(),
        ],
      ),
    );
  }
}
