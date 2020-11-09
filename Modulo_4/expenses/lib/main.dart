import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //estamos fazendo com que a class MyHomePage seja o componete que define
      //como sera a tela de inicio (home)
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //cabeçalho
      appBar: AppBar(
        title: Text("Exepenses"),
      ),

      //corpo
      body:
          //centralizando os componentes do corpo do App na tela
          Center(
        child: Text(
          "Verção inicial",
          style: TextStyle(
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}
