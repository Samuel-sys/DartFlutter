import './produto.dart';

class VendaItem {
  Produto produto;
  int quantidade;
  double _preco;

  VendaItem({this.produto, this.quantidade = 1});

  double get preco {
    if (produto != null) {
      _preco = produto.precoComDesconto;
    }
    return this._preco;
  }

  void set preco(double novoPreco) {
    if (novoPreco > 0) {
      this._preco = novoPreco;
      print("foi val: $novoPreco");
    }
  }

  String toString() {
    var retorno = "codigo: ${produto.codigo} " +
        ", nome: ${produto.nome} " +
        ", preço unitario: R\$${produto.preco}";

    if (produto.desconto < 1) {
      produto.desconto *= 100;
    }

    retorno += produto.desconto != 0 ? ", desconto: ${produto.desconto}% " : "";
    retorno += ", quantidade: $quantidade, Val: R\$${_preco} \n";
    return retorno;
  }
}
