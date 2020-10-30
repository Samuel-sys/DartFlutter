main() {
  List<int> lista = [5, 2, 4, 6, 7];

  print(segundoItemDaLista(lista));

  //como essa function foi determinada com o tipo generic String ele apresenta
  //erro na sintaxe já que o List lista e do tipo generic <int>
//print(segundoItemDaListaV2<String>(lista));

  //já nesse caso foi definido como o generic o mesmo tipo generic da lista
  print(segundoItemDaListaV2<int>(lista));

  //se não informa qual o tipo generic e atribuido o valor dynamic
}

//o termo Object suporta todos os tipo e semelhante ao tipo dynamic
Object segundoItemDaLista(List<Object> list) {
  return list.length >= 2 ? list[1] : null;
}

//essa function vai ter o tipo generic definido pelo usuario na inicialização da function no codigo
E segundoItemDaListaV2<E>(List<E> list) {
  return list.length >= 2 ? list[1] : null;
}
