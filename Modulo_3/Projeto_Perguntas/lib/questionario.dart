import 'package:flutter/material.dart';

import 'questao.dart';
import 'resposta.dart';

class Questionario extends StatelessWidget {
  final String pergunta;
  final respostas;
  final void Function(int) funcao;

  //o parametro com @required são campos obrigatorios apa a inicialização
  Questionario(
      {@required this.pergunta,
      @required this.respostas,
      @required this.funcao});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Questao(pergunta),
      //apresenta todos os elementos na lista de Widget com os dados entregues
      ...respostas.map((resp) {
        //criamos um Widget Resposta com os dados das possíveis resposta
        return Resposta(
          texto: resp["texto"], //pegamos dentro da List
          funcao: () => funcao(resp["pontuacao"]),
        );
      }).toList(), //convertemos o valor em um formato List
    ]);
  }
}
