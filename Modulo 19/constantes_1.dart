import 'dart:io';

main() {
  //Área da circunferência = PI * raio * raio

  /* como o PI não pode sofrer alterações no sistema 
   * ela e uma constante com o termo "const" esse termo  não permite
   * que ela receba valor fora do tempo de compilação
   * ou seja ela não é "Run Time" que pode ser definida no tempo de execução
   * ela tem seu valor já predefinido no seu codigo e não pode ser alterado
   * nem se quer definido por valores atribuidos por variaveis
   */
  const double PI = 3.1415;
  //o cursor fica na mesma linha do texto imprimido
  stdout.write("Informe o valor do raio: ");
  /*
   * como o "raio" não pode sofrer no decorrer do programa ele foi constituido
   * como uma constante com o termo "final" que faz com que ela não possa sofrer
   * variações no decorrer do programa, podendo ter os valores atribuidos pelo
   * usuario no tempo de execução (Run Time)
   */
  final double raio =
      double.parse(//converte o texto escrito pelo usuario no tipo double
          stdin.readLineSync()); //recebe o valor que o usuario inserir na tela

  /* 
     * perceba que o "stdout" e o "stdin" começam com as siglas
     * "std" tendo por mudança apenas o termo "in" e "out"
     * que significa in = input \\ out = output
     */

  //o cursor fica na linha de baixo
  print("O valor do raio é: " + raio.toString());

  var area = PI * raio * raio;
  print("O valor da área e: " + area.toString());
}
