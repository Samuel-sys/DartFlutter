main() {
  var alunos = [
    {'nome': 'Alfredo', 'nota': 9.9},
    {'nome': 'Wilson', 'nota': 9.3},
    {'nome': 'Maria', 'nota': 8.7},
    {'nome': 'Guilherme', 'nota': 8.1},
    {'nome': 'Ana', 'nota': 7.6},
    {'nome': 'Ricardo', 'nota': 6.9},
  ];

  var totalNotas = alunos
      //pega todos os valores do Map na posição 'nota' e registra em aluno
      .map((aluno) => aluno['nota'])
      //pega todos os valores de aluno  e convertem para double
      .map((nota) => (nota as double).roundToDouble())
      //soma todos os valores
      .reduce((value, element) => value + element);

  var media = totalNotas / alunos.length;

  print(totalNotas);

  print(" a media é: $media");
}
