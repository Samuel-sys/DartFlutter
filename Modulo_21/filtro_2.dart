main() {
  List<double> notas = [8.2, 7.1, 6.3, 4.4, 3.9, 8.8, 9.1, 5.1];

  //criamos uma function que retorna um valor boolean (verdadeiro ou falso)
  //onde que se analisa a nota de um aluno e se for maior ou igual a 7 retorna
  //um valor true
  bool Function(double) boasFn = (double nt) => nt >= 7;

  //criamos uma nova lista com apenas as notas boas
  var notasBoas = notas.where(boasFn);

  /*
   * O metodo where ira fazer uma analise atraves de uma function onde que se
   * a function retornar um valor true ele adiciona na variavel do tipo List
   * notasBoas
   */

  print("===========Notas==========");
  print(notas);

  print("========Notas Boas========");
  print(notasBoas);
}
