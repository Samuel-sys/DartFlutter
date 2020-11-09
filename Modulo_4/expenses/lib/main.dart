import './models/transaction.dart';
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
  //criando 2 objetos da class Transaction e atribuindo valores
  final _transaction = [
    //Tênis
    Transaction(
      id: "t1",
      title: 'Novo tênis de Corrida',
      value: 310.76,
      date: DateTime.now(),
    ),

    //Conta de Luz
    Transaction(
      id: 't2',
      title: 'Conta de Luz',
      value: 211.30,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //cabeçalho
        appBar: AppBar(
          title: Text("Exepenses"),
        ),

        //corpo
        body: Column(
          //o padrão do mainAxisAlignment tem como padrão o parametro start
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          //preenche todo o width da coluna (Column)
          crossAxisAlignment: CrossAxisAlignment.stretch,

          //O children diferente do child aceita
          //mais de um componete (mais de uma linha ou coluna etc)
          children: <Widget>[
            //por não ter uma definção do comprimeto da coluna (width) a Column
            //pega como parametro de width o elemento que tiver o maior width
            Container(
              child: Card(
                child: Text("Grafico"),
                elevation: 5,
              ),
            ),

            //Columns de transferencias realizadas
            Column(
              children:
                  //List responsável por apresentar todos os objetos de tranferencia
                  _transaction.map((tr) {
                //manipulando os dado do Objeto Transaction
                return Card(
                    child: Row(
                  children: [
                    //apresenta o valor da transação
                    Container(
                      //Adicionando margin ao container que irá apresentar
                      //o valor das transferências realizadas
                      margin: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),

                      //decorando a Caixa que apresenta o preço do produto
                      decoration: BoxDecoration(
                        //decorando a borda da Caixa
                        border: Border.all(
                          color: Colors.purple,
                          width: 2,
                        ),
                      ),

                      //espaçamento entre os Elementos
                      padding: EdgeInsets.all(10),
                      child: Text(
                        tr.value.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, //negrito
                            fontSize: 20,
                            color: Colors.purple),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Text(tr.title),
                        Text(tr.date.toString()),
                      ],
                    )
                  ],
                ));
              }).toList(), //converte para um List<Widget>
            )
          ],
        ));
  }
}
