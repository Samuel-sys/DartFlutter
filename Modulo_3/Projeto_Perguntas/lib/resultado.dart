import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  //final
  final int pontuacao;
  final void Function() function;

  //Declaração da class
  //os parametros com o termo @required são obrigatorios
  Resultado({@required this.pontuacao, this.function});

  //cria um texto para o usuario conforme a pontuação dele
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

  //Widget com a mensagem do usuario e um botão para reiniciar a partida
  @override
  Widget build(BuildContext context) {
    return Column(
      //coloca os dados da coluna no centro da tela
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            fraseResultado, //metodo que retorna a String de apresentação da UI
            style: TextStyle(
              fontSize: 28, //Tamanho da letra
            ),
          ),
        ),
        //botão para reiniciar o questionario
        FlatButton(
          child: Text(
            "Reiniciar?",
            style: TextStyle(
              fontSize: 18, //Tamanho da letra
            ),
          ),
          textColor: Colors.blue, //cor do botão
          onPressed: this.function, //função entrege no parametro da class
        ),
      ],
    );
  }
}
