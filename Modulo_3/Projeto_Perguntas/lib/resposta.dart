import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final texto;
  final Function funcao;

  Resposta({this.funcao, this.texto = "Pergunta"});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: Text(texto),
        onPressed: funcao,
      ),
    );
  }
}
