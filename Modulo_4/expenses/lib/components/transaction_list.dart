import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function(String) onDelete;

  TransactionList(
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
                    trailing: MediaQuery.of(context).size.width > 450
                        ? FlatButton.icon(
                            onPressed: () => onDelete(tr.id),
                            icon: Icon(
                              Icons.delete,
                              color: Theme.of(context).errorColor,
                            ),
                            label: Text("Deletar",
                                style: TextStyle(
                                  color: Theme.of(context).errorColor,
                                )),
                          )
                        : IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => onDelete(tr.id),
                            color: Theme.of(context).errorColor,
                          ),
                  ),
                );
              },
            ),
    );
  }
}
