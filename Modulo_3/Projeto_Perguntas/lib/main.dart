import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  //Lista com todos os dados a serem manipulados no sistema
  final _perguntas = const [
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

  bool get temPerguntaSelecionada => _perguntaSelecionada < _perguntas.length;

  void _responder() {
    //atualiza o state da pagina do sistema
    setState(() => _perguntaSelecionada++);
    print(_perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    //lista com as respostas da pergunta selecionada
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]["resposta"]
        : null;

    return MaterialApp(
      home: Scaffold(
        /****cabeçalho do app****/
        appBar: AppBar(
          title: Text("Perguntas"),
        ), //

        /****corpo do app****/
        body:
            //se a pergunta selecionada existir ele cria o corpo do app
            temPerguntaSelecionada
                ? Column(children: <Widget>[
                    Questao(_perguntas[_perguntaSelecionada]["texto"]),
                    //apresenta todos os elementos na lista de Widget com os dados entregues
                    ...respostas.map((resp) {
                      //criamos um Widget Resposta com os dados das possíveis resposta
                      return Resposta(
                        texto: resp,
                        funcao: _responder,
                      );
                    }).toList(), //convertemos o valor em um formato List
                  ])
                : null, //se não houver pergunta selecionada ele não cria o corpo do app
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
