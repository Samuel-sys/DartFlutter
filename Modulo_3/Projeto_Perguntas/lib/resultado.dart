import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() function;

  Resultado({@required this.pontuacao, this.function});

  String get fraseResultado {
    if (pontuacao < 8) {
      return "Parabens";
    } else if (pontuacao < 12) {
      return "Você e bom!";
    } else if (pontuacao < 16) {
      return "Impressionate";
    } else {
      return "Nível Jedi!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(
              fontSize: 28,
            ),
          ),
        ),
        FlatButton(
          child: Text(
            "Reiniciar?",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          textColor: Colors.blue,
          onPressed: this.function,
        ),
      ],
    );
  }
}
