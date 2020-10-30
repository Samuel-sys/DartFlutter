main() {
  var alunos = [
    {'nome': 'Alfredo', 'nota': 9.9},
    {'nome': 'Wilson', 'nota': 9.3},
    {'nome': 'Maria', 'nota': 8.7},
    {'nome': 'Guilherme', 'nota': 8.1},
    {'nome': 'Ana', 'nota': 7.6},
    {'nome': 'Ricardo', 'nota': 6.9},
  ];

  //String Function(Map elemento) pegarApenasONome =

  String Function(Map) pegar = (elemento) => elemento["nome"];

  int Function(String) qtdeDeLetras = (texto) => texto.length;

  int Function(int) dobro = (n) => n * 2;

  var resultado = alunos.map(pegar).map(qtdeDeLetras).map(dobro);

  print(resultado);

  print("\n\n"); //espaçamento

  print(alunos);
}

teste(List alunos) {
  Function Function(
    String campo,
  ) pegarCampo = (campo) {
    //essa functione dividida em 2 para o cliente poder escolher o nome do campo
    //que ele deseja separar no Map

    //campo = campo;

    return (Map elemento) {
      return elemento[campo];
    };
  };

  var campoNome = pegarCampo("nome"); // armazena a Function

  var nomes = alunos.map(campoNome);

  print(nomes);
}
