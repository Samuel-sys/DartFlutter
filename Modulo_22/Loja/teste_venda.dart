import 'dart:io';
import './produto.dart';
import './venda_item.dart';
import './Venda.dart';
import './cliente.dart';

main() {
  var func = "";
  //apresenta o logotipo da empresa
  telaInicial();

  //Lista de vendas realizadas
  List<Venda> historicoDeVendas = [];
  //var com os produtos cadastrados
  var listaDeCompras = nota();

  //loop de repetição para controlar a UI (o sistema so se encerra quando o cliente digitar sair)
  while (func.toLowerCase() != "sair") {
    //registra os itens comprados pelo usuario e o valor de cada um deles
    List<VendaItem> notaFiscal = listaDeCompras();

    //cadastra o cliente como um objeto
    Cliente cliente = cadastraCliente();

    //adiciona a venda no historico de vendas
    historicoDeVendas.add(Venda(cliente: cliente, itens: notaFiscal));

    //pergunta se o usuario quer sair do sistema
    print("Para sair e ver todas as compra feitas escreva \"SAIR\"");
    func = stdin.readLineSync();
  }
  //mostra todas as compra que foram feitas no sistema
  print(historicoDeVendas
      .toString()
      .replaceAll("[", "")
      .replaceAll("]", "")
      .replaceAll("\n, ", "\n"));

  //print(historicoDeVendas.reduce((a, e) => a.valorTotal));
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

List<VendaItem> Function() nota() {
  List<Produto> listaProd = [];
  listaProd.add(new Produto(nome: 'Arroz roxo', preco: 15.00, codigo: 1));
  listaProd.add(new Produto(nome: 'Feijão roxo', preco: 20.80, codigo: 2));
  listaProd.add(new Produto(nome: 'Leite roxo', preco: 5.99, codigo: 3));
  listaProd.add(new Produto(nome: 'Suco roxo', preco: 10.49, codigo: 4));
  listaProd.add(new Produto(nome: 'Batata palha roxo', preco: 5.19, codigo: 5));
  // listaProd.add(new Produto(nome: 'teste', preco: 5, codigo: 6));

  print(listaProd
      .toString()
      .replaceAll("[", "")
      .replaceAll("]", "")
      .replaceAll("\n, ", "\n"));

  return () {
    var func = "";
    List<VendaItem> carrinho = [];

    while (func.toLowerCase() != "sair") {
      VendaItem item = new VendaItem();
      //pede o codigo do item a ser comprado
      stdout.write("Codigo de item a ser comprado:");
      int cod = int.parse(stdin.readLineSync());

      if (cod > listaProd.length || cod <= 0) {
        print("Codigo invalido!!");
      } else {
        //cria um objeto com os valores do produto escolhido
        Produto produtoEscolhido = null;
        produtoEscolhido = listaProd[cod - 1];

        stdout.write("Quantidade: ");
        //registra a quantidade de itens comprados
        item.quantidade = int.parse(stdin.readLineSync());

        stdout.write("Desconto: ");
        produtoEscolhido.desconto = double.parse(stdin.readLineSync());

        // print(prodEscolhidos.preco);
        // print(listaProd[cod - 1].preco * qtd);

        print(produtoEscolhido);
        item.produto = produtoEscolhido;
        carrinho.add(item);

        print("\nDeseja sair ? digite sair");
        func = stdin.readLineSync();
      }
    }

    //mostra a lista de compra
    print("\nLista de compra\n");
    print("===========================================================================================================" +
        "\n${carrinho.toString().replaceAll("[", "").replaceAll("]", "").replaceAll("\n, ", "\n")}" +
        "===========================================================================================================");

    return carrinho;
  };
}
