import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/auth.dart';
import '../exceptions/firebase_exceptions.dart';

enum AuthMode {
  Signup, //Cadastro
  Login, //Login
}

class AuthCard extends StatefulWidget {
  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
//
  GlobalKey<FormState> _form = GlobalKey();
  bool isLoading = false;

  //Enum que e responsavel por informa o estado da Page
  AuthMode _authMode = AuthMode.Login;

  //controler da Senha
  final _passwordControler = TextEditingController();

  void _showErrorDialog(String msg) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Ocoreu um erro!"),
        content: Text(msg),
        actions: <Widget>[
          FlatButton(
            child: Text("Fechar"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  //Map responsavel por registra os dados para serem comparados pelo sistema
  final Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  Future<void> _submit() async {
    //Se algum campo não estiver valido ele para a execução do bloco de comando
    if (!this._form.currentState.validate()) {
      return;
    }

    //informa que os dados estão sendo processados
    setState(() {
      isLoading = true;
    });

    //execulta todos os eventos de onSave no form
    _form.currentState.save();

    Auth auth = Provider.of<Auth>(context, listen: false);

    try {
      //controle de erro

      //se tiver no estado de Login efetua login
      if (_authMode == AuthMode.Login) {
        //o provider pega os dados e autentifica na API e assim faz o login
        await auth.login(
          this._authData['email'],
          this._authData['password'],
        );
      }
      //no estado de registro cadastra o usuario
      else {
        //o provider pega os dados e registra o novo login
        await auth.signup(
          this._authData['email'],
          this._authData['password'],
        );
      }
    } on AuthException catch (error) {
      //erro em tempo de conexão com a API
      this._showErrorDialog(error.toString());
    } catch (error) {
      //erro ainda não catalogado fora da are de acesso da API
      this._showErrorDialog("Ocoreu um erro inesperado");
    }
    //informa que os dados já foram processados
    setState(() {
      this.isLoading = false;
    });
  }

  void _switchAuthMode() {
    setState(() {
      this._authMode =
          //condição
          this._authMode == AuthMode.Login
              ? AuthMode.Signup //true
              : AuthMode.Login; //false
    });
  }

  //Widget
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Card(
      //estilo da page
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: 0.75 * deviceSize.width,
        padding: EdgeInsets.all(16),
        child: Form(
          key: this._form,
          //corpo da Pag
          child: Column(
            children: <Widget>[
              //Login / Email
              TextFormField(
                decoration: InputDecoration(labelText: 'E-mail'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.isEmpty ||
                      !value.contains("@") ||
                      !value.contains(".com")) {
                    return 'Informe um e-mail valido';
                  }
                  return null;
                },
                onSaved: (value) => _authData['email'] = value,
              ),

              //Senha
              TextFormField(
                decoration: InputDecoration(labelText: 'Senha'),
                controller: this._passwordControler,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.isEmpty || value.length < 6) {
                    return 'Informe uma senha valida';
                  }
                  return null;
                },
                onSaved: (value) => _authData['password'] = value,
              ),

              //Confirmar Senha (So e abilitado se o usuario entra na area de registro)
              if (_authMode == AuthMode.Signup)
                TextFormField(
                  decoration: InputDecoration(labelText: 'Confirmar Senha'),
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  validator: _authMode == AuthMode.Signup
                      ? (value) {
                          if (value != this._passwordControler.text) {
                            return 'Senha são diferentes!';
                          }
                          return null;
                        }
                      : null,
                ),

              //espaçamento
              SizedBox(height: 20),

              if (this.isLoading)
                CircularProgressIndicator()
              else
                //cadastro/login
                RaisedButton(
                  //estilo
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: Theme.of(context).primaryColor,
                  textColor: Theme.of(context).primaryTextTheme.button.color,
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 8.0,
                  ),
                  child: Text(
                      _authMode == AuthMode.Login ? 'ENTRAR' : 'REGISTRAR'),

                  //evento
                  onPressed: this._submit,
                ),

              FlatButton(
                onPressed: this._switchAuthMode,
                child:
                    Text(_authMode == AuthMode.Login ? 'REGISTRAR' : 'ENTRAR'),
                textColor: Theme.of(context).primaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
