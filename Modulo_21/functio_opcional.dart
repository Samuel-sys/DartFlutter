import 'dart:math';

main() {
  int n1 = numeroAleatorio();
  int n2 = numeroAleatorio(6);

  print(n1); //dando como parametro o valor de default

  print(n2); //dado como parametro o valor 6

  impremirData(5); // setando apenas o dia (campo obrigatorio)

  impremirData(5, 8);
  /*
    * setando apenas o dia (o dia e um campo obrigatorio) e o mes
    * ja o mes e o ano são campos opcionas
  */

  impremirData(6, 8, 1998);
}

/*
 * Caso você deseja fazer um parametro que não seja obrigatorio utilize o recurso
 * dos "[]" onde que se declara um valor de default para a variavel 
 * (caso não entregue um parametro)
*/
int numeroAleatorio([int maximo = 11]) {
  return Random().nextInt(maximo);
}

void impremirData(int dia, [int mes = 8, int ano = 1998]) {
  print("$dia/$mes/$ano");
}
