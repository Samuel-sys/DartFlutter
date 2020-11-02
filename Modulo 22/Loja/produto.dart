class Produto {
  //codigo do produto
  int codigo = 0;
  //nome do produto
  String nome = "";
  //preço do produto
  double preco = 0;
  //desconto do produto
  double _desconto = 0;

  Produto({this.codigo = 0, this.nome, this.preco = 0, double desconto = 0}) {
    //faz o calculo do valor do produto já com o desconto definido
    _desconto = desconto;
    desconto = desconto > 1 ? desconto / 100 : desconto;
    preco = preco * (desconto - 1).abs();
  }

  //formata para um formato que o usuario entenda
  double get desconto {
    if (_desconto > 1) {
      _desconto /= 100;

      preco /= _desconto;

      _desconto *= 100;
    }

    return _desconto;
  }

  void set desconto(double descont) {
    //se o valor de desconto for maior que 1 divide por 100
    //para ter um valor compativel com o calculo para receber o valor final
    _desconto = descont > 1 ? descont / 100 : descont;
    preco *= (_desconto - 1).abs();
  }

  //apresenta os dados do objeto
  String toString() {
    var retorno = "codigo: ${this.codigo} " +
        ", nome: ${this.nome} " +
        ", preço: R\$${this.preco}" +
        ", desconto: $_desconto% \n";
    return retorno;
  }
}
