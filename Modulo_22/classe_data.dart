class Data {
  int dia;
  int mes;
  int ano;

  //quando você coloca o this. ele ira entender que esta se falando de que você
  //esta referenciando algo que esta dentro da class instancia
  //você pode usar uma variavel da propia class como parametro em um metodo
  //
  //Data({int dia = 1, int mes = 1, int ano = 1970}) {
  //  this.dia = dia;
  //  this.mes = mes;
  //  this.ano = ano;
  //}
  //

  Data({this.dia = 1, this.mes = 1, this.ano = 1970});

  Data.ultimoDiaDoAno(this.ano) {
    this.dia = 31;
    this.mes = 12;
  }

  String dataFormatada() {
    return "$dia/$mes/$ano";
  }

  //nesse caso estamo padronizando o metodo ToString para um padrão informado pela class
  String ToString() => dataFormatada();

  /*
   * OU
   * 
   * String ToString(){
   *    return dataFormatada();
   * }
   */

}

main() {
  var dataDefinida = new Data(dia: 3, mes: 8, ano: 2000);

  print("Data definida: $dataDefinida");
  //atribuindo valores a classe data
  //dataAniverdario.dia = 3;
  //dataAniverdario.mes = 8;
  //dataAniverdario.ano = 2020;

  //para instanciar o objeto Data não e obrigatorio o uso da palavra "new"
  Data dataDefault = Data();
  //nesse caso ele irá apresentar o valor de default por não ter entregue nem um valo
  print("Data de default: $dataDefault");

  print("\n\n ============ Apresentação dos metodos ============");
  //você pode criar um padrão para a apresentação dos valores atraves de um Metodo
  print(dataDefinida.dataFormatada());

  //você pode padronizar o metodo que apresenta os dados da sua class com o
  //formato String criando um metodo com o nome de ToString
  print(dataDefinida.ToString());

  //se esse metodo for cria (ToString) não e necessario utilizar nem o .ToString()
  print(dataDefinida);

  // ultimo dia do ano
  print(Data.ultimoDiaDoAno(2000));
}
