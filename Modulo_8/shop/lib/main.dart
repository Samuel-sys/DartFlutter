import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:shop/views/products_detaial_screen.dart';

import 'views/products_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //Provider Responsavel pela lista de produtos
      create: (context) => Products(),

      //MaterialApp
      child: MaterialApp(
        title: 'Minha Loja',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: "Lato",
        ),

        //Tela Home
        home: ProductOverviewScreen(),

        //routes
        routes: {AppRoutes.PRODUCT_DETAIL: (_) => ProductDetaialScreen()},
      ),
    );
  }
}
