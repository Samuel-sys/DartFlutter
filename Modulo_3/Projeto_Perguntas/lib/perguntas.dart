class Perguntas {
  //Lista de Perguntas e alternativas de respostas e das pontuações conforme as respostas
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

  //Variaveis
  int _posicao = 0; //informa em que posição da lista (pergunta) ele esta
  int _pontuacao = 0; //informa a pontuação que o usuario tem

  //informa a posição da lista que deseja ser consultada
  set posicao(int posicaoList) => this._posicao = posicaoList;
  int get posicao => this._posicao; //informa em que posição a lista esta
  void proximaPergunta() =>
      this._posicao++; //adiciona 1 a variavel assim levando a proxima questão

  //soma a pontuação do usuario com o novo valor
  void somaPontuacao(int pontos) => _pontuacao += pontos;
  get pontuacao => _pontuacao; //informa quantos pontos o usuario fez

  //retorna um valor Booleano informando que se tiver mais uma pergunta (item na lista)
  //tem mais uma pergunta = true
  //não tem mais perguntas = false
  bool get temPerguntaSelecionada => _posicao < _perguntas.length;

  //zera as variaveis para voltar aos parametros iniciais
  void retornaQuestionario() {
    this._posicao = 0;
    this._pontuacao = 0;
  }

  //retorna apenas a pergunta
  String get perguntas => _perguntas[this._posicao]["texto"];

  //retorna uma lista de alternativas de posiveis respostas da pergunta
  List get respostas => _perguntas[this._posicao]["resposta"];
}
