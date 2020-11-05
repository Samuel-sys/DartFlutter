import 'dart:io';

main() {
  loopWhile();
  loopDoWhile();
}

loopWhile() {
  var digitado = '';

  while (digitado.toUpperCase() != 'SAIR') {
    print("Digite algo ou sair: ");
    digitado = stdin.readLineSync();
  }

  print("Sair");
  /*
   * 
   * while(CONDIÇÃO){
   *    comando;
   * }
   * 
   * O loop de WHILE e um loop de repetição condicional onde que 
   * so se pode sair do loop de repetição quando a CONDIÇÃO entregue
   * a ele for falso
   * 
   * o Loop de repetição while pode ser execultado 
   * no minimo 0 e no maximo n vezes
   */
}

loopDoWhile() {
  bool para = false;

  do {
    print(para);
  } while (para);

  /*
   * do{
   *    comando;
   * }while(CONDIÇÃO);
   * 
   * O loop de repetição DO WHILE e um loop de repetição condicional, mas com 
   * a condição no fim do comando, fazendo assim com que o bloco de comando
   * dentro do loop seja execultado pelo menos 1 vez antes de verificar a condição
   * assim se a condição for de valor true continua no loop se não sai do loop
   * 
   * o Loop de repetição do while pode 
   * ser executado no minimo 1 vez e no maximo n
   */
}
