import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  // final dateController = TextEditingController();

  final void Function(String, double) onSubmit;

  TransactionForm({@required this.onSubmit});

  _submitForm() {
    //armazena o titulo da transação a variavel
    final String title = this.titleController.text;

    //tenta converter o valor digiatado para double caso não consiga
    //atribui o valor 0
    final value = double.tryParse(this.valueController.text) ?? 0.0;

    //se um dos valores for invalido ele não efetua o cadastro
    if (title.isEmpty || value <= 0) {
      return;
    }

    //essa function ira adicionar a nova transação a lista
    onSubmit(title, value);
  }

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
            onSubmitted: (_) => _submitForm(),
            decoration: InputDecoration(
              labelText: 'Titulo',
            ),
          ),

          //campo de VALOR DE TRANSFERENCIA
          TextField(
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onSubmitted: (_) => _submitForm(),
            controller: valueController,
            decoration: InputDecoration(
              labelText: 'Valor (R\$)',
            ),
          ),

          // //campo da DATA DA TRANSFERENCIA
          // TextField(
          //   keyboardType: TextInputType.datetime,
          //   controller: dateController,
          //   decoration: InputDecoration(
          //     labelText: 'Data',
          //   ),
          // ),

          //Botão de execução de cadastro
          Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
            FlatButton(
              onPressed: _submitForm,
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
