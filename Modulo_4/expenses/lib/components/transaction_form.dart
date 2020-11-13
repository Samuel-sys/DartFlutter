import 'package:expenses/components/adaptative_button.dart';
import 'package:expenses/components/adaptative_date_picker.dart';
import 'package:flutter/material.dart';

import 'adaptative_textField.dart';

bool thisIsIOS = false;

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm({@required this.onSubmit, @required bool isIOS}) {
    thisIsIOS = isIOS;
  }

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();

  final _valueController = TextEditingController();

  DateTime _selectedDate;

  bool allFilled = false;

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
      //informa que ainda existem campos a serem preenchidos
      setState(() => this.allFilled = true);
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
            SizedBox(
              height: 0.1 * MediaQuery.of(context).size.height,
            ),
            Text(
              "Registro de Gasto",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 0.1 * MediaQuery.of(context).size.height,
            ),
            //campo de TITULO
            AdaptativeTextFild(
              controller: _titleController,
              onSubmitted: (_) => _submitForm(),
              label: 'Titulo',
              isIOS: thisIsIOS,
            ),

            //campo de VALOR DE TRANSFERENCIA
            AdaptativeTextFild(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(),
              controller: this._valueController,
              label: 'Valor (R\$)',
              isIOS: thisIsIOS,
            ),

            AdaptativeDatePicker(
              isIOS: thisIsIOS,
              selectedDate: _selectedDate,
              onDateChanged: (newDate) {
                setState(() {
                  this._selectedDate = newDate;

                  //se for um aparelho com sistema IOS ele não execulta o metodo
                  //submitForm
                  if (!thisIsIOS) {
                    this._submitForm();
                  }
                });
              },
            ),

            //Botão de execução de cadastro
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                AdaptativeButton(
                  onPressed: _submitForm,
                  label: "Nova Transação",
                  isIOS: thisIsIOS,
                ),
              ],
            ),

            //Informa que ainda existem campos a serem preenchidos
            Expanded(
              child: this.allFilled
                  ? Center(
                      child: Text(
                        "Preencha todos os campos!",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    )
                  : Text(""),
            )
          ],
        ),
      ),
    );
  }
}
