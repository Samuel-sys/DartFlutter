class Produto {
  int codigo;
  String nome;
  double preco;
  double desconto;

  Produto({this.codigo = 0, this.nome, this.preco = 10, this.desconto = 0});

  double get precoComDesconto {
    if (desconto > 1) {
      desconto /= 100;
    }

    return (1 - desconto).abs() * preco;
  }

  String get detalhesProd {
    return "codigo: ${this.codigo} " +
        "nome: ${this.nome} " +
        "preço: R\$${this.preco} ";
  }

  String toString() {
    var retorno = "codigo: ${this.codigo} " +
        ", nome: ${this.nome} " +
        ", preço: R\$${this.preco}";

    if (desconto < 1) {
      desconto *= 100;
    }

    retorno += desconto != 0 ? ", desconto: $desconto% \n" : "\n";
    return retorno;
  }
}
