import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    //atualiza o state da pagina do sistema
    setState(() => _perguntaSelecionada++);
    print(_perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    //Lista com todos os dados a serem manipulados no sistema
    final List<Map<String, Object>> perguntas = [
      {
        //o texto a ser apresentado no topo do App com a pergunta
        "texto": "Qual é a sua cor favorita?",

        //o texto de cada botão a ser apresentado como possivel respota
        "resposta": ["Azul", "Verde", "Amarelo", "Preto"],
      },
      {
        "texto": "Qual é o seu animal favorita?",
        "resposta": ["Coelho", "Elefante", "Cobra", "Leão"],
      },
      {
        "texto": "Qual é o seu instrutor favorita?",
        "resposta": ["Maria", "João", "Leo", "Pedro"],
      },
    ];

    //lista com Widgets do butão com as opções das possiveis respostas
    List<Widget> respostas = [];

    //ele cria um botão para cadas alternativel possivel no questionario atual
    for (var resp in perguntas[_perguntaSelecionada]["resposta"]) {
      //adiciona um botão a lista
      respostas.add(Resposta(
        texto: resp, //coloca como texto o item na lista encontrada
        funcao:
            _responder, //função que envia o parametro para se saber em que questão estamos
      ));
    }
    return MaterialApp(
      home: Scaffold(
        /****cabeçalho do app****/
        appBar: AppBar(
          title: Text("Perguntas"),
        ), //

        /****corpo do app****/
        body: Column(children: <Widget>[
          Text(perguntas[_perguntaSelecionada]["texto"]),
          ...respostas, //lista de widget com todos os botões de respostas
        ]),
      ), //
    );
  }
}

@override
class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
