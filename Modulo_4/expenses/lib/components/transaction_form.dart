import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  final void Function(String, double) onSubmit;

  TransactionForm({@required this.onSubmit});

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
                //armazena o titulo da transação a variavel
                final String title = this.titleController.text;

                //tenta converter o valor digiatado para double caso não consiga
                //atribui o valor 0
                final value = double.tryParse(this.valueController.text) ?? 0.0;

                //essa function ira adicionar a nova transação a lista
                onSubmit(title, value);
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
