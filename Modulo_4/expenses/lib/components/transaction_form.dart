import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  final Function(String, double) function;

  TransactionForm({@required this.function});

  @override
  Widget build(BuildContext context) {
    return //Registro de Transferencias
        Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          //campo de TITULO
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              labelText: 'Titulo',
            ),
          ),

          //campo de VALOR DE TRANSFERENCIA
          TextField(
            controller: valueController,
            decoration: InputDecoration(
              labelText: 'Valor (R\$)',
            ),
          ),

          //Botão de execução de cadastro
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            FlatButton(
              onPressed: () {
                //essa function ira adicionar a nova transação a lista
                function(this.titleController.text,
                    double.parse(this.valueController.text));
              },
              child: Text(
                "Nova Transação",
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
            ),
          ]),
        ]),
      ),
    );
  }
}
