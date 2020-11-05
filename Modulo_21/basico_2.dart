import 'dart:math';

main() {
  int resultado = somar(2, 5);

  print(resultado);

  resultado = somarNumeroAleatorio();

  print(resultado);
}

/*
 * pode se entregar variaveis como parametro para serem manipuladas pela function
 * como no exemplo a seguir onde se pede 2 variaveis do tipo int para fazer a
 * equação de soma com os 2 valores entregues, assim retornando o valor da soma
 * doas 2 variaveis
 * 
 * se você declara apenas o nome da variavel e não especificar o tipo da variavel
 * e tido como um tipo dynamic
 */

int somar(int a, int b) {
  return a + b;
}

int somarNumeroAleatorio() {
  int a = Random().nextInt(11);
  int b = Random().nextInt(11);

  return a + b;
}
