import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTrransactions {
    return List.generate(7, (index) {
      //dias da semana
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = //
          this //List
              .recentTransaction
              //pega os valores onde a data e proximo do ultimo dia da sema
              .where((e) {
                return e.date.day == weekDay.day &&
                    e.date.month == weekDay.month &&
                    e.date.year == weekDay.year;
              })
              //transforma em uma list com apenas os valores das transações
              //efetuadas nos dia escolhidos
              .map((e) => e.value)
              //soma todos os valores e retorna o resultado
              .reduce((v, e) => v + e);

      return {
        //ele pega o valor do dia e descobra que dia da semana e essa data
        //o "[0]" tem a função de pegar a primeira letra da String que informa
        //qual dia da semana e a Data informada
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[Text(recentTransaction[0].date.toString())],
      ),
    );
  }
}
