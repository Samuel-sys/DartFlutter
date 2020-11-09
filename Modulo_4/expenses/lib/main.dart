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
        body: Column(
          //O children diferente do child aceita
          //mais de um componete (mais de uma linha ou coluna etc)
          children: <Widget>[
            //por não ter uma definção do comprimeto da coluna (width) a Column
            //pega como parametro de width o elemento que tiver o maior width
            Container(
              width: double.infinity,
              child: Card(
                child: Text("Grafico"),
                elevation: 5,
              ),
            ),
            Card(
              child: Text("Lista de Transações"),
              elevation: 5,
            )
          ],
        ));
  }
}
