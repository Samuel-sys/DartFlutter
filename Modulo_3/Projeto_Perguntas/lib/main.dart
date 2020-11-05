import 'package:flutter/material.dart';
import 'package:Projeto_Perguntas/perguntas.dart';
import 'questionario.dart';
import 'resultado.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  Perguntas perguntas = Perguntas();

  void _responder(int pontuacao) {
    if (perguntas.temPerguntaSelecionada) {
      //atualiza o state da pagina do sistema
      setState(() {
        perguntas.proximaPergunta();
        perguntas.somaPontuacao(pontuacao);
      });
    }
    print(perguntas.pontuacao);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        /****cabeçalho do app****/
        appBar: AppBar(
          title: Text("Perguntas"),
        ), //

        /****corpo do app****/
        body: perguntas.temPerguntaSelecionada
            ? Questionario(
                pergunta: perguntas.perguntas,
                respostas: perguntas.respostas,
                funcao: _responder,
              )
            : Resultado(),
      ),
    );
  }
}

@override
class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
