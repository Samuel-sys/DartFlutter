import 'dart:math';

import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//Gera um item da lista de Transaction (tensaction_list)

class TransactionItem extends StatefulWidget {
  final Transaction tr;
  final Function(String) onDelete;

  const TransactionItem({
    Key key,
    @required this.tr,
    @required this.onDelete,
  }) : super(key: key);

  static final cor = [
    Colors.blue,
    Colors.red,
    Colors.blueAccent,
    Colors.yellow,
  ];

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _backgroundColor;

  @override
  // ignore: must_call_super
  void initState() {
    final int i = Random().nextInt(TransactionItem.cor.length);
    _backgroundColor = TransactionItem.cor[i];
    super.initState();
  }

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
          backgroundColor: this._backgroundColor,
          child: FittedBox(
            child: Text("R\$${widget.tr.value.toStringAsFixed(2)}"),
          ),
        ),

        //Titulo da Transferencia
        title: Text(
          widget.tr.title,
          style: Theme.of(context).textTheme.headline6,
        ),

        //Data da transferencia
        subtitle: Text(DateFormat('d MMM y').format(widget.tr.date)),
        trailing: MediaQuery.of(context).size.width > 450
            ? FlatButton.icon(
                onPressed: () => widget.onDelete(widget.tr.id),
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
                onPressed: () => widget.onDelete(widget.tr.id),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}
