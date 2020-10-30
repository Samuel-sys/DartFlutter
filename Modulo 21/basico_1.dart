import 'dart:io';

main() {
  print("Informe um numero");
  var num1 = double.parse(stdin.readLineSync());

  print("Informe mais um numero");
  var num2 = double.parse(stdin.readLineSync());

  print("Informe uma expressão matematica (+, -, *, /)");
  var mat = stdin.readLineSync();

  equacao(num1, num2, mat);
}

/*
 * uma function tem 2 formas as que retornam valor e as que não voltam
 * isso e definido pelo tipo indicado antes da criação da função
 * 
 * 
 * TIPO nomeFunction(){
 *      return "comando";
 * }
 * 
 * na area TIPO se coloca o tipo que ira retornar na function que sera o valor
 * entregue na área do return (vale apena avisar que se o valor entregue for incompativel
 * com o parametro entregue e considerado um erro de sintaxe)
 * 
 * se não informar o tipo de retorno da functione considerado que irá se retornar
 * um valor dynamic (qualquer tipo de valor). para não ter retorno na function
 * se coloca o parametro void (vazio) antes do declarar o nome da functio 
 */

void equacao(double n1, double n2, String mat) {
  switch (mat) {
    case '+':
      print("A soma de $n1 com $n2 é ${n1 + n2}");
      break;
    case '-':
      print("A subitração de $n1 com $n2 é ${n1 - n2}");
      break;
    case '*':
      print("A multiplicação de $n1 com $n2 é ${n1 * n2}");
      break;
    case '/':
      print("A divisão de $n1 com $n2 é ${n1 / n2}");
      break;
    default:
      print("Não tem como fazer uma equação com o parametro $mat");
  }
}
