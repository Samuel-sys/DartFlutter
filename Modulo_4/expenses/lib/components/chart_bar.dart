import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String labal;
  final double value;
  final double percentage;

  ChartBar({
    this.labal,
    this.value,
    this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //valor gasto no dia
        FittedBox(
          child: Text('${value.toStringAsFixed(2)}'),
        ),

        //espaçameto
        SizedBox(height: 5),

        //proporção do tamanho do grafico
        Container(
          height: 60,
          width: 10,

          //
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              //Definido o formato do container do grafico
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.green,
                    width: 1.0,
                  ),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),

              //preenchimento do container do grafico
              FractionallySizedBox(
                heightFactor: percentage, //1 = 100% | 0.5 == 50%
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        ),

        //espaçamento
        SizedBox(height: 5),

        //dia da semana
        Text(this.labal),
      ],
    );
  }
}
