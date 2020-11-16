import 'package:expenses/components/chart_bar.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  const Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      //Loop de repetição que adiciona o valor das Transferencias feitas no dia
      for (var conta in this.recentTransaction.where((e) {
        return e.date.day == weekDay.day &&
            e.date.month == weekDay.month &&
            e.date.year == weekDay.year;
      })) {
        totalSum += conta.value; //soma o valor de cada transferencia
      }

      //retorna um Map com os dados das transferencias feitas na ultima semana
      return {
        //apresenta a primeira letra coerente o dia da semana
        'day': DateFormat.E().format(weekDay)[0],
        'values': totalSum,
      };
    }).reversed.toList();
  }

  double get _weekTotalValue {
    return groupedTransactions.fold(0.0, (sum, tr) {
      return sum + tr['values'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions.map((tr) {
            return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  labal: tr['day'],
                  value: tr['values'],
                  percentage: this._weekTotalValue == 0
                      ? 0
                      : (tr['values'] as double) / _weekTotalValue,
                ));
          }).toList(),
        ),
      ),
    );
  }
}
