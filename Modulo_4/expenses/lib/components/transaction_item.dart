import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//Gera um item da lista de Transaction (tensaction_list)

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.tr,
    @required this.onDelete,
  }) : super(key: key);

  final Transaction tr;
  final Function(String p1) onDelete;

  @override
  Widget build(BuildContext context) {
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
  }
}
