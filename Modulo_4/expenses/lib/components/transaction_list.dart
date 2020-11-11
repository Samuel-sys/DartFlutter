import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return //Columns de transferencias realizadas
        Container(
      height: 300, //defino o tamanho do container da Lista de Tranferencias
      child: transactions.isEmpty
          ? Column(
              //subistitui o SizedBox() utilizado na aula
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  "Nada cadastrado",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Container(
                  height: 200, //altura da imagem
                  child: Image.asset(
                    "lib/assets/images/waiting.png", //endereco da imagem
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              //apresenta a quantidade de itens dentro da List
              itemCount: transactions.length,

              itemBuilder: (ctx, index) {
                final tr = transactions[index];
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    //Valor da transferencia
                    leading: CircleAvatar(
                      radius: 30,
                      child: FittedBox(
                        child: Text("R\$${tr.value.toStringAsFixed(2)}"),
                      ),
                    ),

                    //Titulo da Transferencia
                    title: Text(
                      tr.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),

                    //Data da transferencia
                    subtitle: Text(DateFormat('d MMM y').format(tr.date)),
                  ),
                );
              },
            ),
    );
  }
}
