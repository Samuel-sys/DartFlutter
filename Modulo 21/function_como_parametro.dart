import 'dart:io';

main() {
  //essa function vai ter que perguntar ao usuario o operador matematico que ele
  //deseja usar na equação

  //(#OperadorMatematico)
  String Function() operado = () {
    String operadorMat; //armazena o resultado que o cliente digitar

    stdout.write("Selecione um operador (+, -, *, /): ");

    operadorMat = stdin.readLineSync();

    //caso o operador seja valido retorna a opção escolhida pelo cliente
    if (operadorMat == "+" ||
        operadorMat == "-" ||
        operadorMat == "*" ||
        operadorMat == "/") {
      return operadorMat;
    } else {
      //caso o contrario informa que o valor não e valido e retorna nulo
      print("operador matematico invalido");
      return null;
    }
  };

  //essa function pede uma function de parametro que retorne um valor string
  calcula(operado);
}

calcula(String Function() mat) {
  print("Informe um valor");
  double num1 = double.parse(stdin.readLineSync());

  print("Informe um outro valor");
  double num2 = double.parse(stdin.readLineSync());

  // a function #OperadorMatematico e execultada e retorna um valor conforme o
  // valor se execulta o bloco de comando escolhido
  switch (mat()) {
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
  }
}
