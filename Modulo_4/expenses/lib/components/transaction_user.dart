import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
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

  void _adiconarTransaction(String title, double value) {
    final newTransactio = Transaction(
      id: "",
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transaction.add(newTransactio);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //Apresenta as transações efetuadas
        TransactionList(_transaction),

        //Form de cadastro de Transação
        TransactionForm(onSubmit: _adiconarTransaction),
      ],
    );
  }
}
