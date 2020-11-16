import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/chart.dart';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';
import 'models/transaction.dart';

//Essa variavel teve que se tornar global pos estava
//dando erro dentro do MyHomePage, como ela precisa ser passada de parametro
//para as demais class/Widgets tive que por ela como global para evitar bugs
bool isIOS = Platform.isIOS;
//Caso vc queira retira o Button de alteração de interface coloque esse valor
//const ou final

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
            headline6: const TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            button: const TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
        //padrão de estilo do AppBar
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: const TextStyle(
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

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    //inicia o Observer que apresenta o status do app no console
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    //encerra o Observer que apresenta o status do app no console
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    //imprime o state do App no console
    print(state);
  }

  List<Transaction> _transaction = [];

  //responsavel por informa um ID ao item da lista
  //(preferi assim para ter um maior controle)
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
          return TransactionForm(
            onSubmit: _adiconarTransaction,
            isIOS: isIOS,
          );
        });
  }

  //cadastrar transferencia
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
  //simplificando o Widget IconButton colocando os dois tipo (Antroid \ IOS)
  Widget _getIconButton({IconData icon, Function function}) {
    return isIOS
        ? GestureDetector(onTap: function, child: Icon(icon)) //icon IOS
        : IconButton(icon: Icon(icon), onPressed: function); //icon Android
  }

  @override
  Widget build(BuildContext context) {
    //o aparelho esta no modo paisagem ? conforme a resposta e dado o valor
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final actionsAppBar = <Widget>[
      Row(
        children: <Widget>[
          //apresenta um Button com o simbolo do FLutter com a função
          //de mudar o desainer para o sistema IOS ou Android
          Container(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  isIOS = !isIOS;
                });
              },
              child: FlutterLogo(
                size: 35,
              ),
            ),
          ),

          if (isLandscape)
            _getIconButton(
              icon: isIOS
                  ? CupertinoIcons.refresh //sendo IOS o icon e o mesmo
                  : _showChart
                      ? Icons.bar_chart
                      : Icons.list,
              function: () => setState(() => _showChart = !_showChart),
            ),
          _getIconButton(
            icon: isIOS ? CupertinoIcons.add : Icons.add,
            function: () => _openTransactioFormModal(context),
          ),
        ],
      ),
    ];

    //componetes da appBar
    final PreferredSizeWidget appBar = isIOS
        ?
        //IOS
        CupertinoNavigationBar(
            middle: const Text("Despesas Pessoais"),
            //no trailing ele precisa ser feito dentro de um widget
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: actionsAppBar,
            ),
          )
        :
        //ANDROID
        AppBar(
            title: const Text("Despesas Pessoais"),
            actions: actionsAppBar,
          );

    //altura da tela disponivel no aparelho (valo 100%)
    final availabelHeight =
        MediaQuery.of(context).size.height - //altura da tela do aparelho
            appBar.preferredSize.height - //altura da appBar
            MediaQuery.of(context).padding.top; //altura da barra de notificação

    //componentes do Body
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
                alignment: Alignment.topCenter,
                //defino o tamanho do container da Lista de Tranferencias
                height: availabelHeight *

                    /*
                     * Eu tenho um pouco de toque para a imagem não ficar
                     * muito grande (imagem de Default) Defini que quando
                     * Não tiver itens na lista o Container tera um tamano e
                     * quando tiver itens na lista outro
                     */
                    (isLandscape
                        ? this._transaction.length == 0
                            ? 0.7
                            : 1
                        : this._transaction.length == 0
                            ? 0.6
                            : 0.7),
                child: TransactionList(_transaction, _deleteTransaction),
              ),
          ],
        ),
      ),
    );

    return isIOS //define que tipo de corpo o sistema tera um Android ou IOS
        ? CupertinoPageScaffold(
            navigationBar: appBar,
            child: bodyPage,
          )
        : Scaffold(
            //cabeçalho
            appBar: appBar,

            //corpo
            body: bodyPage,
//quebra de linha
            floatingActionButton:
                //se for um aparelho IOS ele não apresenta o FloatingActionButton
                isIOS
                    ? Container()
                    : FloatingActionButton(
                        onPressed: () => _openTransactioFormModal(context),
                        child: Icon(Icons.add),
                      ),
            floatingActionButtonLocation: //coloca o Button no centro da tela
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
