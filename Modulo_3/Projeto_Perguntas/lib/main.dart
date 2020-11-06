import 'package:flutter/material.dart';
import 'package:Projeto_Perguntas/perguntas.dart';
import 'questionario.dart';
import 'resultado.dart';

main() => runApp(PerguntaApp());

//class que inicia o App
@override
class PerguntaApp extends StatefulWidget {
  //cria um State novo
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}

class _PerguntaAppState extends State<PerguntaApp> {
  //ponte da class com as perguntas, respostas e pontuações do questionario
  var perguntas = Perguntas();

  //metodo de ação conforme o botão da alternativa selecionada
  void _responder(int pontuacao) {
    //se o parametro da pergunta for um valor valido inicia uma nova State
    if (perguntas.temPerguntaSelecionada) {
      //atualiza o state da pagina do sistema
      setState(() {
        perguntas
            .proximaPergunta(); //leva para a proxima possição do questionario

        perguntas.somaPontuacao(
            pontuacao); //adiciona os pontos obtidos no questionario
      });
    }
  }

  //reinicia o questionario
  void _reiniciaQuestionario() {
    //atualiza o state da pagina do sistema
    setState(perguntas
        .retornaQuestionario /* zera todos os parametos das questões*/);
  }

  @override
  Widget build(BuildContext context) {
    //corpo do App
    return MaterialApp(
      home: Scaffold(
        /****cabeçalho do app****/
        appBar: AppBar(
          title: Text("Perguntas"),
        ), //

        /****corpo do app****/
        body:
            //se tiver mais uma questão a ser apresentada execulta o Questionario
            //se não apresenta o Resultado e da a possibilidade de reiniciar o Questionario
            perguntas.temPerguntaSelecionada
                ? Questionario(
                    pergunta: perguntas.perguntas, //String com a Pergunta
                    respostas: perguntas.respostas, //Lista com as alternativas
                    funcao: _responder, //Função com as ações a serem feitas
                  )
                : Resultado(
                    pontuacao:
                        perguntas.pontuacao, //pontuação obtina no questionario
                    function:
                        _reiniciaQuestionario, //reinicia o Questionario e zera todos os parametros
                  ),
      ),
    );
  }
}
