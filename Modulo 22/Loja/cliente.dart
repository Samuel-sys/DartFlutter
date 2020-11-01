class Cliente {
  //cadastra um cliente como objeto no sistema
  String nome;
  String cpf;

  Cliente({this.nome, this.cpf});

  String toString() => "Nome: $nome, CPF: $cpf";
}
