import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/auth.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/order.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:shop/views/auth_home_screen.dart';
import 'package:shop/views/cart_screen.dart';
import 'package:shop/views/orders_screen.dart';
import 'package:shop/views/product_from_screen.dart';
import 'package:shop/views/products_detaial_screen.dart';
import 'package:shop/views/products_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //o MultiProvider permite passar uma List com varios Provaiders
      providers: [
        ChangeNotifierProvider(create: (context) => new Auth()),

        //esse provider vai ser criado com a List nula certifiquese de
        //no de execultao o metodo loadProducts() do mesmo provider
        //para atulizar a list com todos os dados dos produtos existentes no App
        ChangeNotifierProxyProvider<Auth, Products>(
          //Cria um Provider vazio para ser usado de parametro
          create: (context) => new Products(),

          //utiliza o provider de Products criado no proprio
          //ChangeNotifierProxyProvider alem do provider de Auth criado anteriormente
          update: (context, auth, previousProducts) {
            return Products(
              auth.token,
              auth.userId,
              previousProducts.items,
            );
          },
        ),

        ChangeNotifierProxyProvider<Auth, Orders>(
          //Cria um Provider vazio para ser usado de parametro
          create: (context) => new Orders(),

          //utiliza o provider de Products criado no proprio
          //ChangeNotifierProxyProvider alem do provider de Auth criado anteriormente
          update: (context, auth, previousOrders) {
            return Orders(auth.token, auth.userId, previousOrders.items);
          },
        ),

        ChangeNotifierProvider(create: (context) => new Cart()),
      ],

      //MaterialApp
      child: MaterialApp(
        title: 'Minha Loja',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: "Lato",
        ),

        //routes
        routes: {
          AppRoutes.AUTH_HOME: (_) => AuthOrHomeScreen(),
          AppRoutes.PRODUCT_DETAIL: (_) => ProductDetaialScreen(),
          AppRoutes.CART: (_) => CartScreeen(),
          AppRoutes.ORDERS: (_) => OrdersScreen(),
          AppRoutes.PRODUCTS: (_) => ProductsScreen(),
          AppRoutes.PRODUCTS_FORM: (_) => ProductFormScreen(),
        },
      ),
    );
  }
}
