main() {
  var notas = [7.3, 5.4, 7.7, 8.1, 5.5, 4.9, 9.1, 10.0];

  var totalNotas = notas.reduce(somar);

//Ou
//var totalNotas = notas.reduce((acumulado, elemento) => acumulado + elemento);

  print(totalNotas);

  var nomes = ['Ana', 'Bia', 'Carlos', 'Daniel', 'Maria', 'Pedro'];

  print(nomes.reduce(juntar));
//Ou
//print(nomes.reduce((value, element) => "$value, $element"));
}

String juntar(String acumulador, String elemento) {
  print("$acumulador =>, $elemento");

  return "$acumulador, $elemento";
}

double somar(double acumulador, double elemento) {
  print("$acumulador $elemento");
  return acumulador + elemento;
}
