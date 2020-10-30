main() {
  listFinal();
  listaFinalConst();
  listConst();
}

listConst() {
  /* 
   * define que aquela
   * lista não pode sofrer nenhuma alteração assim impedindo que se adicione
   * remova item da lista ou atribua uma nova lista a constante
   */
  const List nomes = ['Samuel', 'Daniel', 'Marcos'];

  //tirando o comentario apresenta o erro de compilação
  //nomes = ['Pedro', "João"];

  //tirando o comentario apresenta o erro de compilação
  // nomes.add('Antonio');

  //tirando o comentario apresenta o erro de compilação
  //nomes.remove('Daniel');
  print(nomes);
}

listaFinalConst() {
  /*
   * Uma List como o parametro de "final" não permite que você sobrescreva
   * ela com outra lista
   * 
   * e o parametro const depois do simbolo de atribuição (=) define que aquela
   * lista não pode sofrer nem uma alteração assim impedindo que se adicione
   * remova item da lista
   * 
   * esse metodo se equivale a uma constante comum
   * 
   * caso o primeiro parametro "final" não existisse poderis sobrescrever a List
   * por uma outra nova List
   */
  final List nomes = const ['Samuel', 'Daniel', 'Marcos'];

  //tirando o comentario apresenta o erro de compilação
  //nomes = ['Pedro', "João"];

  //tirando o comentario apresenta o erro de compilação
  // nomes.add('Antonio');

  //tirando o comentario apresenta o erro de compilação
  //nomes.remove('Daniel');
  print(nomes);
}

listFinal() {
  /*
   * Uma List como o parametro de "final" não permite que você sobrescreva
   * ela com outra lista
   */
  final List nomes = ['Samuel', 'Daniel', 'Marcos'];

  //tirando o comentario apresenta o erro de compilação
  //nomes = ['Pedro', "João"];

  /*
   * Mas permite que você possa adicionar outros valores 
   * alem de poder tambem removelos
   */
  nomes.add('Antonio');
  print(nomes);

  nomes.remove('Daniel');
  print(nomes);
}
