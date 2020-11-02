import './produto.dart';

class VendaItem {
  Produto produto;
  int quantidade = 1;

  VendaItem({this.produto, this.quantidade = 1});

  String toString() {
    var retorno = "codigo: ${this.produto.codigo} " +
        ", nome: ${this.produto.nome} " +
        ", preço unitario: R\$${this.produto.preco}" +
        ", desconto: ${this.produto.desconto}% " +
        ", quantidade: ${this.quantidade}, Val: R\$${this.produto.preco * this.quantidade} \n";
    return retorno;
  }
}
