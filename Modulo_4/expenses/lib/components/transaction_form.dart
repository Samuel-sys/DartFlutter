import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm({@required this.onSubmit});

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();

  final _valueController = TextEditingController();

  DateTime _selectedDate;

  //apresenta o datePicker
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pinckedDate) {
      if (pinckedDate == null) {
        return;
      }
      setState(() {
        this._selectedDate = pinckedDate;
      });
    });
  }

  _submitForm() {
    //armazena o titulo da transação a variavel
    final String title = this._titleController.text;

    //tenta converter o valor digiatado para double caso não consiga
    //atribui o valor 0
    final value = double.tryParse(this._valueController.text) ?? 0.0;

    //armazena a data selecionada pelo usuario
    final data = this._selectedDate;

    //se um dos valores for invalido ele não efetua o cadastro
    if (title.isEmpty || value <= 0 || data == null) {
      return;
    }

    //essa function ira adicionar a nova transação a lista
    widget.onSubmit(title, value, this._selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return //Registro de Transferencias
        Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            //campo de TITULO
            TextField(
              controller: _titleController,
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Titulo',
              ),
            ),

            //campo de VALOR DE TRANSFERENCIA
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(),
              controller: _valueController,
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),

            //campo da DATA DA TRANSFERENCIA
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text(this._selectedDate == null
                        ? 'Nenhuma data selecionada!'
                        : "Data Selecionada: " +
                            "${DateFormat('d/MM/y').format(this._selectedDate)}"),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text('SelecionarData',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    onPressed: _showDatePicker,
                  ),
                ],
              ),
            ),

            //Botão de execução de cadastro
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  onPressed: _submitForm,
                  child: Text("Nova Transação"),
                  color: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).textTheme.button.color,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
