import 'package:flutter/cupertino.dart';

class Transaction {
  final String id;
  final String title;
  final double value;
  final DateTime date;

  //Definindo construtores e colocando parametros obrigatorios
  //com o parametro @required
  const Transaction(
      {@required this.id,
      @required this.title,
      @required this.value,
      @required this.date});
}
