main() {
  print("====== Tabuada do 9 ======");

  //for(variavel ; condição; constante)
  for (int i = 0; i < 10; i++) {
    print("$i * 9 = ${i * 9}");
  }

  // como a variavel foi definida fora do for não precisa colocala como
  //parametro dentro do for isso já e sub entendido
  int b = 0;
  for (; b <= 0; b++) {
    print(b <= 0); //enquanto a condição for verdadeira ele continua no loop
  }

  print(b <= 0); //quando a condição for falsa ele sai do loop

  /*
   * o loop de repetição for precisa de 3 parametros
   * 
   * for (VARIAVEL; CONDIÇÃO; CONSTANTE){}
   * 
   * a variavel e a variavel de controle do loop onde que ela
   * vai recever um valor constante associado a ele (que seria a 
   * CONSTANTE) e quando chegasse na CONDIÇÃO ele sairia do loop
   * 
   * o loop de repetição for e um loop controle oque e isso um
   * loop que dificilmente irá entrar em um loop infinito por ter
   * uma variavel de controle dentro dela que tem a função de parar
   * o loop quando chegar na situação definida da condição
   * 
   * o loop para quando a condição definida foi false
   */
}
