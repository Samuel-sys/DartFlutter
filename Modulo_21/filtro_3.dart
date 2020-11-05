main() {
  List<double> notas = [8.2, 7.1, 6.3, 4.4, 3.9, 8.8, 9.1, 5.1];

  bool Function(double) boa = (nt) => nt >= 7;

  var notasBoas = filtrar<double>(boa, notas);

  print(notasBoas);

  List<String> nomes = ["Samuel", "Marcos", "Ana", "Demilade", "Jó"];

  bool Function(String) nomeGrande = (nome) => nome.length >= 7;

  List<String> listaNomes = filtrar(nomeGrande, nomes);

  print(listaNomes);
}

List<E> filtrar<E>(bool Function(E) filtro, List<E> lista) {
  List<E> retorno = [];

  for (var i in lista) {
    if (filtro(i)) {
      retorno.add(i);
    }
  }

  return retorno;
}
