import 'package:flutter/material.dart';
import 'package:meals/utils/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final themeApp = ThemeData(
    primarySwatch: Colors.pink,
    accentColor: Colors.amber,
    fontFamily: "Raleway",
    canvasColor: Color.fromRGBO(255, 254, 229, 1),
    textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(
            fontSize: 20,
            fontFamily: "RobotoCondensed",
          ),
        ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deli Meals',

      theme: themeApp, //tema do app

      routes: routesPages, //
    );
  }
}
