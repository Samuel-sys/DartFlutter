main() {
  int a = 3;
  int b = 4;

  a++; //se soma +1 ao valor da variavel a
  print(a);

  a--; //se subtrai -1 do valor da variavel a
  print(a);

  //POSFIX
  //se soma depois de apresentar o valor da variavel b
  print(b++);

  print(b);

  //PREFIX
  //se subtrai antes de apresentar o valor da vairavel b
  print(--b);

  print("Valores\n a = $a \n b = $b");

  //veja que o valor da variavel de B foi subtraido -1 antes de fazer
  //a operação logica já o de a so depois da operação logica
  print(--b == a++);
}
