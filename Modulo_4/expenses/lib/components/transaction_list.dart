import './transaction_item.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function(String) onDelete;

  const TransactionList(
    this.transactions,
    this.onDelete,
  );
  @override
  Widget build(BuildContext context) {
    return //Columns de transferencias realizadas
        Container(
      //se passar uma lista vazia apresenta uma imagen de default
      child: transactions.isEmpty
          ? LayoutBuilder(
              builder: (ctx, constraints) {
                return Column(
                  //subistitui o SizedBox() utilizado na aula
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      height: constraints.maxHeight * 0.2,
                      child: Text(
                        "Nenhuma Transação Cadastrada!",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    Container(
                      height: 0.8 * constraints.maxHeight,
                      child: Image.asset(
                        "lib/assets/images/waiting.png", //endereco da imagem
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                );
              },
            )
          : ListView.builder(
              //apresenta a quantidade de itens dentro da List
              itemCount: transactions.length,

              itemBuilder: (ctx, index) {
                final tr = transactions[index];
                return TransactionItem(tr: tr, onDelete: onDelete);
              },
            ),
    );
  }
}
