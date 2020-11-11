import 'package:flutter/cupertino.dart';

class Transaction {
  final String id;
  final String title;
  final double value;
  final DateTime date;

  //Definindo construtores e colocando parametros obrigatorios
  //com o parametro @required
  Transaction(
      {@required this.id,
      @required this.title,
      @required this.value,
      @required this.date});

  static List<Transaction> listaTransactions() => [
        //Tênis
        Transaction(
          id: "t1",
          title: 'Novo tênis de Corrida',
          value: 310.76,
          date: DateTime.now().subtract(Duration(days: 33)),
        ),

        //Conta de Luz
        Transaction(
          id: 't2',
          title: 'Conta de Luz',
          value: 211.30,
          date: DateTime.now().subtract(Duration(days: 5)),
        ),
      ];
}
