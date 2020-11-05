main() {
  juntar(1, 7);
  juntar("Bom", "dia");
  juntar("Hoje é dia", 15);
}

//por não se declara um tipo de retorno para a function se atribui o valor
//dynamic o mesmo se aplica para os parametros da function juntas
juntar(a, b) {
  print("$a $b");
  return "$a $b";
}
