main() {
  Map<String, double> notas = {
    "Samuel": 10,
    "Marcos": 9.5,
    "Daniel": 8.8,
    "João": 7.0,
    "Patrique": 6.0,
  };

  print("======== Nomes ========");

  for (var nomeAluno in notas.keys) {
    print("Aluno: $nomeAluno");
  }

  print("======== Notas ========");

  for (var nt in notas.values) {
    print("Nota: $nt");
  }

  print("======== Nomes e notas atraves das keys ========");

  for (var id in notas.keys) {
    print("Nome: $id \t\tNota: ${notas[id]}");
  }

  print("======== Nomes e notas atraves dos registros ========");
  for (var registro in notas.entries) {
    print("A nota ${registro.value} e do aluno ${registro.key}");
  }
}
