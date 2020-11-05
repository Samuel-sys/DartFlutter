import 'dart:io';

main() {
  stdout.write("Está chovendo? (S/N)");
  //nesse caso ele retorna true se o usuario escrever a letra "S"
  bool estaChovendo = stdin.readLineSync().toUpperCase() == "S";

  stdout.write("Está frio? (S/N)");
  //nesse caso ele retorna true se o usuario escrever a letra "S"
  bool estaFrio = stdin.readLineSync().toUpperCase() == "S";

  // variavel = condição ? "Resultado caso verdade" : "Resultado caso falso";
  String resultado = estaChovendo || estaFrio ? "Ficar em casa" : "Sair!!";

  print(resultado);

  //pode se usar o operador ternario direto no "print()" ou no "stdout.write()"
  print(estaChovendo && estaFrio ? "Azarado" : "Sortudo");
}
