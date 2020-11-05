main() {
  // sera imputado o valor int automaticamente para a variavel
  var n1 = 2;
  print(n1.runtimeType); //mostrando o tipo da variavel

  // sera imputado o valor double automaticamente para a variavel
  var n2 = 3.1314;
  print(n2.runtimeType); //mostrando o tipo da variavel

  print(n1 + n2); //somando
  print(n1.toString() + n2.toString()); //concatenando
  //o comando "toString()" tem a função de converter a variavel em um tipo texto

  // sera imputado o valor String automaticamente para a variavel
  var texto = "O valor da soma é: ";
  print(texto.runtimeType); //mostrando o tipo da variavel

//já que a variavel texto já e do tipo String não se precisa usar o ".toString()"
  print(texto + // o simbolo de "+" serve para cocatenar nesse caso
          (n1 + n2) //dentro do parentese se faz o cálculo
              .toString() //e convertendo ele para o tipo string para ser impresso na tela
      );

  // se a variavel n1 for do tipo String retorna true se não false
  print(n1 is String);

  // se a variavel n1 for do tipo double retorna true se não false
  print(n1 is double);

  // se a variavel n1 for do tipo int retorna true se não false
  print(n1 is int);
}
