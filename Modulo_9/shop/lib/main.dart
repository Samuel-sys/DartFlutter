import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/order.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:shop/views/cart_screen.dart';
import 'package:shop/views/orders_screen.dart';
import 'package:shop/views/products_detaial_screen.dart';

import 'views/products_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //o MultiProvider permite passar uma List com varios Provaiders
      providers: [
        ChangeNotifierProvider(create: (context) => new Products()),
        ChangeNotifierProvider(create: (context) => new Cart()),
        ChangeNotifierProvider(create: (context) => new Orders()),
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
          AppRoutes.HOME: (_) => ProductOverviewScreen(),
          AppRoutes.PRODUCT_DETAIL: (_) => ProductDetaialScreen(),
          AppRoutes.CART: (_) => CartScreeen(),
          AppRoutes.ORDERS: (_) => OrdersScreen(),
        },
      ),
    );
  }
}
