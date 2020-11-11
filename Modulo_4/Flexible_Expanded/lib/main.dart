import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flexible & Expanded',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Flexible & Expanded'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          //não responsivo, altura e largura devem ser especificados ou então
          //sera colocado o valor que consiga colocar todos os itens dentro dele
          Container(
            height: 100,
            child: Text('Item 1 - pretty big!'),
            color: Colors.red,
          ),

          //ele utiliza um Padding para o elemento colocado dentro dele.
          //Perceba como o Expanded e o Flexible respeita o valor de padding
          //dado e não invade é ele não conta esse valor de padding como um espaço vago
          //para ser preenchido, mas entende que e um espaço preenchido por um elemento.
          Padding(
            padding: EdgeInsets.all(10),
            child: Flexible(
              //ele se adequa se colocar como parametro fit o FlexFit.tight
              //para se adequar ao tamanho dos itens colocado dentro dele basta
              //colocar no parametro fit o valor FlexFit.loose
              fit: FlexFit.tight,

              //isso define a questão da prioridade do Flexible quanto maior o
              //numero maior sera o espaço que ele podera ocupar no percentual
              //do elemento
              flex: 2,
              child: Container(
                height: 100,
                child: Text('Item 2'),
                color: Colors.blue,
              ),
            ),
          ),

          //ele e como se fosse um Flexible com o parametro fit FlexFit.tight
          Expanded(
            //mesmo significado utilizado no Flexible
            flex: 1,
            //nesse caso o Expanded esta com o valor 1 e o Flexible com o valor 2
            //ele ira pegar o espaço dado para ambos dividir em 3 partes (2+1)
            //e dar 1 pedaço para o Expanded e 2 para o Flexible
            //de acordo com o parametro que foi entrague

            child: Container(
              height: 100,
              child: Text('Item 3'),
              color: Colors.orange,
            ),
          ),
        ],
      ),
    );
  }
}
