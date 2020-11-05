/*
 * TIPO Function(TipoParametroS) nomeFunction = (NomesParametros){
 *    return comando;
 * };
 * 
 *  na parte TIPO definimos qual o tipo que essa Function ira retornar se nenhum
 * tipo for definido e atribuido o tipo dynamic
 * 
 * na parte TipoParametros definimos os tipos que serão definidos parametros da
 * function
 * 
 * na parte NomesParametros definimos os nomes dos parametros da function para 
 * serem manipulada dentro do codigo que atribui o valor para a function
 */

main() {
  //aqui temos uma function definida fora do bloco
  int a = somaFn(1, 2);

  print("======= function fora do bloco de comando =======");
  print(a);

  //aqui estamos atribuindo os valores que já foram definidos na function somaFn
  int Function(int, int) soma1 = somaFn;

  print("======== function em formato de variavel ========");
  print("== recebendo os parametros da function somaFn ===");
  print(soma1(5, 2));

  //aqui estamos criando uma Function em variavel definindo o codigo a ser compilado ao executala
  int Function(int, int) soma2 = (a, b) {
    return a + b;
  };

  /*
   * Ou
   * 
   * int Function(int, int) soma2 = (a, b) => a + b;
   * 
   * de uma forma mais enxuta
   */

  print("======== function em formato de variavel ========");
  print(soma2(7, 8));
}

int somaFn(int a, int b) {
  return a + b;
}
