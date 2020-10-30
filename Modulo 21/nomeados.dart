main() {
  //não e obrigatorio atribuir um valor para cada parametro
  //se nenhum valor for atribuido ao parametro e utilizado o falor default dele
  impremirData(mes: 2);

  //não e preciso atribuir os valores comforme a sequencia dada
  impremirData(dia: 5, ano: 2000, mes: 12);
}

/*
 * Com os parametros da function dentro de "{}" definimos os parametros como 
 * nomeadas, que significa que ele além de não serem obrigatorios eles são nomeados
 * ou seja para atrivuir o valores a eles vc tem que inserir o nome do parametro desejado 
 */
void impremirData({int dia = 6, int mes = 8, int ano = 1998}) {
  print("$dia/$mes/$ano");
}
