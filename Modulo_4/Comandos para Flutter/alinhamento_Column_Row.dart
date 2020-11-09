/* 
 * Esse conteúdo e 100% didático ele não tem nem uma função se usado
 * de forma isolada sem os demais componentes do Flutter 
 */

// para tirar os comentarios de todos os codigos tire todos os //#

/*
  * O mainAxisAlignment faz o alinhamento dos elementos de forma
  * horizontal dando assim o espaçamento e definindo a posição de cada
  * elemento
  */

//mainAxisAlignment tem como padrão o parametro start
//# mainAxisAlignment: MainAxisAlignment.start,
/*
  * Cria o Elemento no inicio do conteiner sem espaçamento entre
  * os demais elementos (um espaço em cima e em baixo de cada elemento)
  * 
  * emcima = antes do elemento
  * embaixo = depois do elemento
  */

//# mainAxisAlignment: MainAxisAlignment.end,
/*
  * Cria o Elemento no fim do conteiner sem espaçamento entre
  * os demais elementos (um espaço em cima e em baixo de cada elemento)
  */

//# mainAxisAlignment: MainAxisAlignment.spaceAround,
/* 
  * espaços entre os elementos criando um espaço tanto antes
  * como depois do elemento
  */

//# mainAxisAlignment: MainAxisAlignment.center,
//coloca todos os elementos da Column ou Row centralizados sem
//espaçamento entre eles

//# mainAxisAlignment: MainAxisAlignment.spaceBetween,
//Coloca espaço entre os dois elementos

//==============================================================================

/*
  * O crossAxisAlignment faz o alinhamento dos elementos de forma
  * vertical dando assim o espaçamento e definindo a posição de cada
  * elemento
  */

//crossAxisAlignment tem como padrão o parametro center
//# crossAxisAlignment: CrossAxisAlignment.center,
//deixa o elemento no centralizado na linha do container

//# crossAxisAlignment: CrossAxisAlignment.stretch,
//poem como largura o valor maximo posivel pelo container
// igual colocar o width como double.infinity (100% do espaço da larguta)

//# crossAxisAlignment: CrossAxisAlignment.start,
// coloca o elemento no inicio da linha do container

//# crossAxisAlignment: CrossAxisAlignment.end,
// coloca o elemento no fim da linha do container

//# crossAxisAlignment: CrossAxisAlignment.baseline,
//coloca os elemento com o texto alinhados na mesma linha(não funciona
//em um conteiner do tipo Column)
