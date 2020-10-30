/*
     *	- Números (num, int e double)
  *	- Texto (String)
  *	- Booleano (bool)
     */
main() {
  //separei em funções para uma maior organização
  tipoTexto();
  tipoNumero();
  tiposBooleano();
  tipoDynamic();
}

tipoDynamic() {
  /*
    * O tipo dynamic traz a vantagem de ter a possibilidade de
    * atribuir mais de um tipo de valor a ela no decorrer do codigo
    * logico que não ao mesmo tempo
    */

  dynamic var1 = 1; // e atribuido o tipo int automaticamente para essa variavel

  print(var1.runtimeType);

  var1 = "texto"; //e atribuido o tipo String para a variavel

  print(var1.runtimeType);

  /* isso não pode ser feito com uma variavel do tipo var pq
  * na hora que e atribuido um valor a variavel ela e tipada 
  * com o tipo equivalente ao dado fornecido
  */
}

tipoNumero() {
// =================NUMEROS====================
  int n1 = 3;
  print(n1);
  print(n1.runtimeType);

  double n2 = -5.67;

  print(n2); // apresenta o valor da variavel
  print(n2.abs()); // apresenta o valor da variavel no seu valor absoluto
  print(n2.roundToDouble()); //arredonda o numero do tipo double
  print(n2.truncateToDouble()); //tira as casas decimais

  /*num e o pai de double e int por conta disso ele suporta tanto 
  * numeros com pontos flutuantes como sem pontos flutuantes 
  * (numero apos a virgula)
  */
  num n3 = 6;
  print(n3); //sem ponto flutuante

  n3 = 6.5;
  print(n3); //com ponto flutuante
}

tipoTexto() {
  // =================TEXTO====================

  //"toUpperCase()" converte todas as letras para maiusculo
  String t1 = "bom".toUpperCase();

  // "toLowerCase()" converte todas as letras para minusculo
  String t2 = "DIA".toLowerCase();

  //para concatenar textos utilizamos o simbolo de "+"
  print(t1 + " " + t2);

  int a = 1;
  int b = 1;

  //nesse caso convertemos os numeros para String assim eles são concatenados
  //e não somados
  print(a.toString() + b.toString());

  print("A soma de $a mais $b e de: " +
      // no caso de ter que se fazer uma concatenação e uma equação
      // temos que fazer a equação dentro de "()" e depois converter para um tipo texto (String)
      (a + b).toString());
}

tiposBooleano() {
// =================Boolean====================

/*
* no caso do boolean ele guarda valores de verdadeiro ou falso (true ou false)
* isso pode ser definido ou de forma clara com o atributo:
* true = verdadeiro
* 
* ou
* 
* false = falso
*
* além de tambem poder ser feito com parametros de comparação como 
* 
* X > Y = X maior que Y
* X < Y = X menor que Y
* X >= Y = X maior ou igual que Y
* X <= Y = X menor ou igual que Y
* X != Y = X diferente de Y
* X == Y = X igual a Y
* 
* podendo se usar operadores relacionais como
* 
* || = ou
* && = e
* ! = não
* para saber as funções pesquise sobre tabela verdade
*/
  bool estaFrio = false;
  bool estaChovendo = true;

  //se estiver frio OU chovendo aprensenta o valor de true
  print(estaChovendo || estaFrio);

  //se estiver frio E chovendo aprensenta o valor de true
  print(estaChovendo && estaFrio);

  //OU exclusivo ou seja se os 2 parametros derem veradeiro ele retorna false
  //se os dos parametros derem falso ele tambem retorna falso
  //agora se um parametro for falso e o outro verdadeiro ele retorna verdadeiro
  //basicamente ele retorna verdadeiro apenas se
  //for um parametro de exclusividade "OU" (XOR)
  print(estaChovendo ^ estaFrio);

  var v1 = 1;
  var v2 = 2;

  // se o v1 for IGUAL a v2 retorna true caso o contrario false
  bool igual = v1 == v2;
  print(igual);

  // se o v1 for DIFERENTE a v2 retorna true caso o contrario false
  bool diferente = v1 != v2;
  print(diferente);

  //se a variavel v1 for MAIOR que a v2 retorna true o contrario false
  bool v1Maior = v1 > v2;
  print(v1Maior);

  //se a variavel v1 for MENOR que a v2 retorna true o contrario false
  bool v1Menor = v1 < v2;
  print(v1Menor);
}
