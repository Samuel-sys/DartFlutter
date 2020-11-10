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

    //Conta #00
    Transaction(
      id: 't3',
      title: 'Conta #00',
      value: 211.30,
      date: DateTime.now(),
    ),
    //Conta #00
    Transaction(
      id: 't4',
      title: 'Conta #01',
      value: 211.30,
      date: DateTime.now(),
    ),
    //Conta #00
    Transaction(
      id: 't5',
      title: 'Conta #02',
      value: 211.30,
      date: DateTime.now(),
    ),
    //Conta #00
    Transaction(
      id: 't5',
      title: 'Conta #03',
      value: 211.30,
      date: DateTime.now(),
    ),
    //Conta #00
    Transaction(
      id: 't6',
      title: 'Conta #04',
      value: 211.30,
      date: DateTime.now(),
    ),
    //Conta #00
    Transaction(
      id: 't7',
      title: 'Conta #05',
      value: 211.30,
      date: DateTime.now(),
    ),
    //Conta #00
    Transaction(
      id: 't8',
      title: 'Conta #06',
      value: 211.30,
      date: DateTime.now(),
    ),
    //Conta #00
    Transaction(
      id: 't9',
      title: 'Conta #07',
      value: 211.30,
      date: DateTime.now(),
    ),
    //Conta #00
    Transaction(
      id: 't10',
      title: 'Conta #08',
      value: 211.30,
      date: DateTime.now(),
    ),
    //Conta #00
    Transaction(
      id: 't11',
      title: 'Conta #09',
      value: 211.30,
      date: DateTime.now(),
    ),
    //Conta #00
    Transaction(
      id: 't12',
      title: 'Conta #10',
      value: 211.30,
      date: DateTime.now(),
    ),
    //Conta #00
    Transaction(
      id: 't13',
      title: 'Conta #11',
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
        //Form de cadastro de Transação
        TransactionForm(onSubmit: _adiconarTransaction),

        //Apresenta as transações efetuadas
        TransactionList(_transaction),
      ],
    );
  }
}
