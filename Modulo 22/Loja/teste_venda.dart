import 'dart:io';
import './produto.dart';
import './venda_item.dart';
import 'Venda.dart';
import 'cliente.dart';

main() {
  // var func = "";

  //apresenta o logotipo da empresa
  telaInicial();

  //Lista de vendas realizadas
  List<Venda> venda = [];

  List<VendaItem> nota = carrinho(prods());

  Cliente cliente = cadastraCliente();

  venda.add(Venda(cliente: cliente, itens: nota));

  // print("Para sair e ver todas as compra feitas escreva \"SAIR\"");
  // func = stdin.readLineSync();

  //estava pensando em fazer uma lista de vendas feitas mas por enquanto fica assim
  print(venda.toString());
}

Cliente cadastraCliente() {
  Cliente retorno = new Cliente();

  stdout.write("Nome :");
  retorno.nome = stdin.readLineSync();

  stdout.write("CPF :");
  retorno.cpf = stdin.readLineSync();

  return retorno;
}

void telaInicial() {
  print("=================================================================\n" +
      "██╗░░░░░░█████╗░░░░░░██╗░█████╗░  ██████╗░░█████╗░██╗░░██╗░█████╗░ \n" +
      "██║░░░░░██╔══██╗░░░░░██║██╔══██╗  ██╔══██╗██╔══██╗╚██╗██╔╝██╔══██╗ \n" +
      "██║░░░░░██║░░██║░░░░░██║███████║  ██████╔╝██║░░██║░╚███╔╝░███████║ \n" +
      "██║░░░░░██║░░██║██╗░░██║██╔══██║  ██╔══██╗██║░░██║░██╔██╗░██╔══██║ \n" +
      "███████╗╚█████╔╝╚█████╔╝██║░░██║  ██║░░██║╚█████╔╝██╔╝╚██╗██║░░██║ \n" +
      "╚══════╝░╚════╝░░╚════╝░╚═╝░░╚═╝  ╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝ \n" +
      "===================================================================");
}

List<Produto> prods() {
  List<Produto> listaProd = [];
  listaProd.add(new Produto(nome: 'Arroz roxo', preco: 15.00, codigo: 1));
  listaProd.add(new Produto(nome: 'Feijão roxo', preco: 20.80, codigo: 2));
  listaProd.add(new Produto(nome: 'Leite roxo', preco: 5.99, codigo: 3));
  listaProd.add(new Produto(nome: 'Suco roxo', preco: 10.49, codigo: 4));
  listaProd.add(new Produto(nome: 'Batata palha roxo', preco: 5.19, codigo: 5));
  // listaProd.add(new Produto(nome: 'teste', preco: 5, codigo: 6));

  print(listaProd.toString());

  return listaProd;
}

List<VendaItem> carrinho(List<Produto> listaProd) {
  var func = "";
  List<VendaItem> carrinho = [];
  VendaItem prodEscolhidos = new VendaItem();

  while (func.toLowerCase() != "sair") {
    //pede o codigo do item a ser comprado
    stdout.write("Codigo de item a ser comprado:");
    int cod = int.parse(stdin.readLineSync());

    if (cod > listaProd.length) {
      print("Codigo invalido!!");
    } else {
      stdout.write("Quantidade: ");
      int qtd = int.parse(stdin.readLineSync());

      prodEscolhidos.quantidade = qtd;

      stdout.write("Desconto: ");
      double desconto = double.parse(stdin.readLineSync());

      listaProd[cod - 1].desconto = desconto;

      //conforme o codigo adiciona o item ao objeto que sera adicionado ao carrinho
      prodEscolhidos.produto = listaProd[cod - 1];
      prodEscolhidos.preco = listaProd[cod - 1].precoComDesconto * qtd;

      print(prodEscolhidos.preco * qtd);

      carrinho.add(prodEscolhidos);

      print("\nDeseja sair ? digite sair");
      func = stdin.readLineSync();
    }
  }

  //mostra a lista de compra
  print("\nLista de compra\n" +
      "======================================================================================" +
      "\n${carrinho.toString()}" +
      "======================================================================================");
}
