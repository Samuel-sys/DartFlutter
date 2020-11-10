import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return //Columns de transferencias realizadas
        Column(
      children:
          //List responsável por apresentar todos os objetos de tranferencia
          transactions.map((tr) {
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
                "R\$ ${tr.value.toStringAsFixed(2)}",
                style: TextStyle(
                    fontWeight: FontWeight.bold, //negrito
                    fontSize: 20,
                    color: Colors.purple),
              ),
            ),

            Column(
              //=========Titulo da Transferencia
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  tr.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                //========Data da transferencia
                Text(
                  DateFormat('d MMM y').format(tr.date),
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            )
          ],
        ));
      }).toList(), //converte para um List<Widget>
    );
  }
}