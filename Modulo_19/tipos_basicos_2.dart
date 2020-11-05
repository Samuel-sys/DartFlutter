import 'dart:io';

/*
  -List
  Grupo de elementos indexados (apartir do 0), que aceita repetição de dados
  
  -Set
  Grupo de elementos não indexatos, que não aceita repetição de dados
  
  -Map
  Grupo de elementos compostas de chave e valor, onde se define a chave de valor
  unico não podendo repetir o mesmo parametro de chave 2 vezes (caso repita sera
  sobrescrevido) mas pode se repetir os dado
*/

main() {
  tipoList();
  tipoMap();
  tipoSet();
}

tipoSet() {
  /*um Set e basicamente um Lista que não aceita valores repetidos
  * quando usamos a Tipagem "Set<String>"
  * definimos um Set que entra apenas valores do tipo String 
  * (podemos definir outros tipos como Int, double e etc)
  * caso não tenha nem um parametro da tipagem do Set é dynamic
  */
  Set<String> times = {'São Paulo', 'Palmeiras', 'Flamengo', 'Internacional'};

  //podemos adcionar mais dados ao Set atraves do comando ".add()"
  times.add('Barcelona');
  print(times);
  print("\n");

  //por já existir um campo com o valor 'Barcelona' ele não adiciona outro vez
  times.add('Barcelona');
  times.add('Barcelona');
  print(times);
  print("\n");

  //Para descobrir se já existe ou não um valor igual a esse inserido usamos o
  //comando ".contains" que retorna um valor bool se tiver um dado com o mesmo
  //valor ele retorna um valor true se não false
  print(times.contains('São Paulo'));
  print("\n");

  //apresenta o primeiro dado inserido no Set
  print(times.first);

  //apresenta o ultimo dado inserido no Set
  print(times.last);

//diferente do List o Set so pode ser encontrado atraves do comando ".elementAt"
//e não pelo parametro dentro de "[]"
  print(times.elementAt(2));
}

tipoMap() {
  /*
   * A diferença entre o List e o Map e que no Map você define o sua chave
   * e por isso não aceita chave de valores repetidos
   * caso tenha 2 campos com a mesma chave
   * ele sobrescrever o dado da chave com o ultimo valor informado
  */
  Map telefones = {
    'João': '+55 (11) 1234-5678',

    //repare como o indice de nome joão esta apresentando um erro e analise o erro apresentado
    //'João': '+55 (11) 0000-0000', eu tava com agonia e comentei se quiser ver so tirar o comentario

    'Maria': '+55 (11) 9876-5432',
    'Paulo': '+55 (11) 11111-1111',
    'Samuel': '+55 (11) 0000-0000',

    //a chave não precisa ser necessariamente string
    123: '+55 (00) 0000-0000'
  };
  //depois de definido as chaves e os dados dentro delas
  //não se tem mais como adicionar nem um campo

  print(telefones); // assim apresenta o nome da chave em seguida o valor

  //espaçamento
  print("\n\n");

  print(telefones.keys); // assim apresenta o nome da chave

  //espaçamento
  print("\n\n");

  print(telefones.values); // assim apresenta os valores

  //espaçamento
  print("\n\n");

  //para apresentar um campo expecifico do Map
  //deve-se entregar o nome da chave que foi definida
  print(telefones['João']);
}

tipoList() {
  /*um List e basicamente um Lista quando usamos a Tipagem "List<String>"
  * definimos um List que entra apenas valores do tipo String
  * (podemos definir outros tipos como Int, double e etc)
  * caso não tenha nem um parametro da tipagem da Lista é dynamic
  */
  List<String> nomes = ["Samuel dos Santos Alencar", "Demilade", "Marcos"];

  //adicionando mais um campo
  nomes.add("Antonio");

  //espaçamento
  print("\n\n");

  //apresentando a List com todos os dados gravados nele
  print(nomes);

  //espaçamento
  print("\n\n");

  //pede para o usuario digitar um valor de ID de um usuario expecifico
  print("Escolha uma das posições abaixo para serem deletado");

  apresentaNomes(nomes);

  //pede um ID para o usuario escolher da lista apresentada para ele
  print("escolha um ID");
  int id = int.parse(stdin.readLineSync());

  if (id >= nomes.length) {
    print("ID não existente"); //se ele informar um ID não existente
  } else {
    print("Nome apagado");

    nomes.removeAt(//esse metodo apaga com a definição da possição a ser apagada
        id); //se ele escolher um ID existente deleta a posição informada

    /* ou
     * nomes.remove(nomes[id]); 
     * informando oque esta escrito na possição onde desseja deletar
     */

    apresentaNomes(nomes);
  }
}

apresentaNomes(List nomes) {
  //loop de repetição que mostra todos os campos da Array
  for (int i = 0; i < nomes.length; i++) {
    //apresenta os dados
    print("ID: $i \t\tnome: " + nomes[i]);

    /*
     * ou
     * print("ID: $i \t\tnome: " +nomes.elementAt(i));
    */
  }
}
