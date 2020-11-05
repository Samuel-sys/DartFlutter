class Perguntas {
  final _perguntas = const [
    {
      //o texto a ser apresentado no topo do App com a pergunta
      "texto": "Qual é a sua cor favorita?",

      //o texto de cada botão a ser apresentado como possivel respota
      "resposta": [
        {"texto": "Azul", "pontuacao": 10},
        {"texto": "Verde", "pontuacao": 5},
        {"texto": "Amarelo", "pontuacao": 3},
        {"texto": "Preto", "pontuacao": 1},
      ],
    },
    {
      "texto": "Qual é o seu animal favorita?",
      "resposta": [
        {"texto": "Coelho", "pontuacao": 10},
        {"texto": "Elefante", "pontuacao": 5},
        {"texto": "Cobra", "pontuacao": 3},
        {"texto": "Leão", "pontuacao": 1},
      ],
    },
    {
      "texto": "Qual é o seu instrutor favorita?",
      "resposta": [
        {"texto": "Leo", "pontuacao": 10},
        {"texto": "João", "pontuacao": 5},
        {"texto": "Maria", "pontuacao": 3},
        {"texto": "Pedro", "pontuacao": 1},
      ],
    },
  ];

  int _posicao = 0;
  int _pontuacao = 0;

  bool get temPerguntaSelecionada {
    return _posicao < _perguntas.length;
  }

  set posicao(int posicaoList) => this._posicao = posicaoList;
  int get posicao => this._posicao;

  void somaPontuacao(int pontos) => _pontuacao += pontos;
  get pontuacao => _pontuacao;

  void proximaPergunta() => this._posicao++;

  String get perguntas {
    return _perguntas[this._posicao]["texto"];
  }

  List get respostas {
    return _perguntas[this._posicao]["resposta"];
  }
}
