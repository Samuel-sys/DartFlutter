import 'dart:io';

main() {
  print("Informe um numero");
  var num1 = double.parse(stdin.readLineSync());

  print("Informe mais um numero");
  var num2 = double.parse(stdin.readLineSync());

  print("Informe uma expressão matematica (+, -, *, /)");
  var mat = stdin.readLineSync();

  switch (mat) {
    case '+':
      print("A soma de $num1 com $num2 é ${num1 + num2}");
      break;
    case '-':
      print("A subitração de $num1 com $num2 é ${num1 - num2}");
      break;
    case '*':
      print("A multiplicação de $num1 com $num2 é ${num1 * num2}");
      break;
    case '/':
      print("A divisão de $num1 com $num2 é ${num1 / num2}");
      break;
    default:
      print("Não tem como fazer uma equação com o parametro $mat");
  }

  /*
   * O SWITCH e um desvio de condição, onde se entrega uma variavel
   * que ter o seu dado analizado e confor os casos cadastrados dentro do
   * SWITCH for de igual valor ele execulta o bloco com o valor entregue
   * 
   * switch(variavel){
   *  case 'x':
   *    comando;
   *      break;
   *  case 'y':
   *    comando;
   *      break;
   *  default:
   *    comando;
   * }
   * 
   * o CASE e o valor de comapração com o dado entregue pela variavel ou seja
   * se variavel igual 'x' ele execulta o bloco de comando dentro do case 'x'
   * 
   * o BREAK tem a função de parar o switch quando uma das funções do case for
   * execultada
   * 
   * o DEFAULT e como se fosse o else (do if else) ele sera execultado caso 
   * nenhum dos caso (case) anteriores seja execultado
   */
}
