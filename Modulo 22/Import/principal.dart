import './pessoa.dart';
/*
 * Para acessar uma class onde esta em uma pasta anterior a posição da pasta atual
 * utilizase ".."
 * 
 * EX
 * import '../pastaExemplo/classe.dart';
 * 
 * para acessar uma pasta dentro do diretorio da pasta atual do arquivo
 * 
 * import './pastaExemplo2/classe2.dart';
 */

main() {
  var p1 = Pessoa();
  p1.nome = 'João';

  print('O nome da pessoa é ${p1.nome}.');
}
