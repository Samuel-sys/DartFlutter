import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/chart.dart';
import 'components/controler_platform.dart';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';
import 'models/transaction.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: "Quicksand",

        //padrão de estilo do headline6
        textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            button: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
        //padrão de estilo do AppBar
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      //estamos fazendo com que a class MyHomePage seja o componete que define
      //como sera a tela de inicio (home)
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction> _transaction = [
    Transaction(
      id: "a",
      date: DateTime.now(),
      title: "Teste",
      value: 123.45,
    ),
    Transaction(
      id: "a",
      date: DateTime.now(),
      title: "Teste",
      value: 123.45,
    ),
    Transaction(
      id: "a",
      date: DateTime.now(),
      title: "Teste",
      value: 123.45,
    ),
    Transaction(
      id: "a",
      date: DateTime.now(),
      title: "Teste",
      value: 123.45,
    ),
    Transaction(
      id: "a",
      date: DateTime.now(),
      title: "Teste",
      value: 123.45,
    ),
    Transaction(
      id: "a",
      date: DateTime.now(),
      title: "Teste",
      value: 123.45,
    ),
  ];

  final iconList =
      ControlerPlatform.isIOS ? CupertinoIcons.refresh : Icons.list;
  final iconChart =
      ControlerPlatform.isIOS ? CupertinoIcons.refresh : Icons.bar_chart;

  //responsavel por informa um ID ao item da lista
  int id = 0;

  //informa se o usuario deseja ou não ver o grafico
  bool _showChart = true;

  //Execulta Modal com o form de cadatro de Transaction
  _openTransactioFormModal(BuildContext context) {
    //Cria uma mine janela com o form de cadastro de transferencia
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (_) {
          return TransactionForm(onSubmit: _adiconarTransaction);
        });
  }

  //cadastrar transação
  void _adiconarTransaction(String title, double value, DateTime data) {
    final newTransactio = Transaction(
      id: id.toString(),
      title: title,
      value: value,
      date: data,
    );
    setState(() {
      id++; //troca o numero de Id para o proximo cadastro
      _transaction.add(newTransactio);
    });

    //fecha a o modal do TrasactionForm depois de salvar a newTransaction
    Navigator.of(context).pop();
  }

  //deleta uma transferencia
  void _deleteTransaction(String id) {
    setState(() {
      //toda Transaction que tiver o ID diferente do que foi selecionado pelo
      //usuario se mantem na lista
      this._transaction.removeWhere((e) => e.id == id);
    });
  }

//===========================  Widgets  =========================================
  Widget _getIconButton({IconData icon, Function function}) {
    return ControlerPlatform.isIOS
        ? GestureDetector(onTap: function, child: Icon(icon)) //icon IOS
        : IconButton(icon: Icon(icon), onPressed: function); //icon Android
  }

  @override
  Widget build(BuildContext context) {
    //o aparelho esta no modo paisagem ? conforme a resposta e dado o valor
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final actionsAppBar = <Widget>[
      if (isLandscape)
        _getIconButton(
          icon: _showChart ? iconList : iconChart,
          function: () => setState(() => _showChart = !_showChart),
        ),
      _getIconButton(
        icon: ControlerPlatform.isIOS ? CupertinoIcons.add : Icons.add,
        function: () => _openTransactioFormModal(context),
      ),
    ];

    final PreferredSizeWidget appBar = ControlerPlatform.isIOS
        ?
        //IOS
        CupertinoNavigationBar(
            middle: Text("Despesas Pessoais"),
            //no trailing ele precisa ser feito dentro de um widget
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: actionsAppBar,
            ),
          )
        :
        //ANDROID
        AppBar(
            title: Text("Despesas Pessoais"),
            actions: actionsAppBar,
          );

    //altura da tela disponivel no aparelho (valo 100%)
    final availabelHeight =
        MediaQuery.of(context).size.height - //altura da tela do aparelho
            appBar.preferredSize.height - //altura da appBar
            MediaQuery.of(context).padding.top; //altura da barra de notificação

    final bodyPage = SafeArea(
      child: SingleChildScrollView(
        //permite que a minha pagina tenha um scroll
        child: Column(
          //preenche todo o width da coluna (Column)
          crossAxisAlignment: CrossAxisAlignment.stretch,

          //O children diferente do child aceita
          //mais de um componete (mais de uma linha ou coluna etc)
          children: <Widget>[
            //se estiver no modo paisagem e estiver com a
            //opção de mostrar grafico ativo
            if (this._showChart || !isLandscape)
              //Grafico dos gastos dos ultimos 7 dias
              Container(
                height: availabelHeight * (isLandscape ? 0.7 : 0.3),
                child: Card(
                  child: Chart(this._transaction),
                  elevation: 5,
                ),
              ),

            //Lista de Tranferencias feitas
            if (!this._showChart || !isLandscape)
              Container(
                //defino o tamanho do container da Lista de Tranferencias
                height: availabelHeight * (isLandscape ? 1 : 0.6),
                child: TransactionList(_transaction, _deleteTransaction),
              ),
          ],
        ),
      ),
    );

    return ControlerPlatform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: appBar,
            child: bodyPage,
          )
        : Scaffold(
            //cabeçalho
            appBar: appBar,

            //corpo
            body: bodyPage,
//
            floatingActionButton:
                //se for um aparelho IOS ele não apresenta o FloatingActionButton
                ControlerPlatform.isIOS
                    ? Container()
                    : FloatingActionButton(
                        onPressed: () => _openTransactioFormModal(context),
                        child: Icon(Icons.add),
                      ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
