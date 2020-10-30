main() {
  String nome = "João";
  String status = "aprovado";
  double nota = 9.2;

  //exemplo concatenando
  String frase1 =
      nome + " está " + status + " porque tirou " + nota.toString() + "!";

  //exemplo usando interpolação
  String frase2 = "$nome está $status porque tirou $nota!";
  /*
   * Na interpolação você diminiu a utilização de concatenação
   * ultilizando o simbolo "$" logo em seguida o nome da uma variavel
   * ou constante ele automaticamente possiciona o valor 
   * dessa variavel\constante ao seu texto
   */

  print(frase1);
  print(frase2);

  /* podendo fazer equações atraves da utilização 
   * de "{}" juntos ao simbolode "$"
   * fazendo assim "${ 2 + 2 }
   */
  print("A soma de 2 + 2 é ${2 + 2}");

  //ou para fazermos utilização de operdadores logicos
  print("o numero 2 e maior que o 4 não e verdade ? R: ${2 > 4}");

  //podendo fazer uso ate mesmo de operadores ternarios
  print(
      "${frase1 != frase2 ? "As frases são diferentes" : "As frases são iguais"}");
}
