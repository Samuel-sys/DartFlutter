import 'package:flutter/material.dart';
import 'components/chart.dart';
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
            ),
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
  final List<Transaction> _transaction = Transaction.listaTransactions();

  List<Transaction> get _recentTransactions => this._transaction.where((tr) {
        return tr.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
      }).toList();

  void _adiconarTransaction(String title, double value) {
    final newTransactio = Transaction(
      id: "",
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transaction.add(newTransactio);
    });

    //fecha a o modal do TrasactionForm depois de salvar a newTransaction
    Navigator.of(context).pop();
  }

  _openTransactioFormModal(BuildContext context) {
    //Cria uma mine janela com o form de cadastro de transferencia
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(onSubmit: _adiconarTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //cabeçalho
      appBar: AppBar(
        title: Text("Exepenses"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openTransactioFormModal(context),
          ),
        ],
      ),

      //corpo
      body: SingleChildScrollView(
        //permite que a minha pagina tenha um scroll
        child: Column(
          //preenche todo o width da coluna (Column)
          crossAxisAlignment: CrossAxisAlignment.stretch,

          //O children diferente do child aceita
          //mais de um componete (mais de uma linha ou coluna etc)
          children: <Widget>[
            Container(
              child: Card(
                child: Chart(this._transaction),
                elevation: 5,
              ),
            ),

            //Lista de Tranferencias execultadas
            TransactionList(_transaction),
//
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactioFormModal(context),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
