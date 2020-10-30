import 'dart:math';

main() {
  var nota = Random() //comando da biblioteca "dart:math"
      .nextInt(11);
  //gera um numero não negativo aleatorio com um valor maximo
  //(sendo que seu eu colocar 11 ira aparecer um numero de 0 ate 10
  //o 11 não e utilizado)

  print("Nota seleciona foi $nota.");

  //estrutura de condição composta
  if (nota > 9) {
    print("Quadro de honra");
  } else if (nota >= 7) {
    print("Aprovado");
  } else if (nota >= 5) {
    print("Recuperação!");
  } else if (nota >= 4) {
    print("Recuperação + Trabalho");
  } else {
    print("Reprovado");
  }

  /*
   * Estrutura de condição Basica
   * 
   *    if(condição){
   *      comando;
   *    }
   * 
   * Nessa condição simples temos apenas 1 if onde que se entraga uma condição
   * caso a condição seja verdadeira ele execulta o blocode comando if
   * 
   * 
   * Estrutura de condição simples
   * 
   *    if(condição){
   *      comando;
   *     } else {
   *        comando;
   *        }
   * 
   * Nessa estrutura de comando simples temos um if e else
   * nesse caso se a condição do if NÃO for verdadeira se execulta o bloco
   * else, caso seja verdadeira se execulta o bloco if
   * 
   * Estrutura de condição composta
   * 
   *    if(condição1){
   *      comando;
   *     } else if(condição2) {
   *        comando;
   *        }
   * 
   * Nesse caso se a condição1 for falsa verificase a condição2 e se ela for
   * verdadeira execulta o bloco 2
   * 
   */
}
