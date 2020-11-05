main() {
  bool estaFrio = false;
  bool estaChovendo = true;

  //se estiver frio OU chovendo aprensenta o valor de true
  print(estaChovendo || estaFrio);

  //se estiver frio E chovendo aprensenta o valor de true
  print(estaChovendo && estaFrio);

  //OU exclusivo ou seja se os 2 parametros derem veradeiro ele retorna false
  //se os dos parametros derem falso ele tambem retorna falso
  //agora se um parametro for falso e o outro verdadeiro ele retorna verdadeiro
  //basicamente ele retorna verdadeiro apenas se
  //for um parametro de exclusividade "OU" (XOR)
  print(estaChovendo ^ estaFrio);

  //nega o valor bool infromado (se o valor for true ele retorna false e vise versa)
  print(!estaChovendo);
}
