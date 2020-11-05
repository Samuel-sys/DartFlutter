main() {
  for (int a = 0; a <= 10; a++) {
    if (a == 6) {
      // se esse if for execultado ele ira executar esse comando break
      //fazendo com que o sistema saia do loop de repetição
      break;
    }
    print("Continua no loop");
  }

  for (int a = 0; a <= 10; a++) {
    //todo numero que for par não ira aparecer no sistema
    if (a % 2 == 0) {
      // se esse if for execultado ele ira executar o comando continue
      //fazendo com que o sistema ignore o resto do bloco de comando
      //voltando assim para o inicio do loop
      continue;
    }

    print(a);
  }
}
