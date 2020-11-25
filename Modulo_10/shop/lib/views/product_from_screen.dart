import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/product.dart';
import 'package:shop/providers/products.dart';

class ProductFormScreen extends StatefulWidget {
  @override
  _ProductFormScreenState createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlFocusNode = FocusNode();
  final _imageUrlControl = TextEditingController();
  final _form = GlobalKey<FormState>();
  final _formData = Map<String, Object>();
  bool _isLoading = false;

  //cria um Listener para a o _imageUrlFocusNode no inicio do State da pagina
  @override
  void initState() {
    super.initState();

    this._imageUrlFocusNode.addListener(_updateImageUrl);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    //isso so pode ser feito se o _formData estiver vazio ou seja na inicilização
    if (this._formData.isEmpty) {
      var product = ModalRoute.of(context).settings.arguments as Product;

      //se for passado um produto ele recebe os valores e coloca no intialValue
      //de cada campo
      if (product != null) {
        this._formData['id'] = product.id;
        this._formData['title'] = product.title;
        this._formData['description'] = product.description;
        this._formData['price'] = product.price;
        this._formData['imageUrl'] = product.imageUrl;

        this._imageUrlControl.text = this._formData['imageUrl'];
      } else {
        //como o price (preço) precisa ser convertido para String se o usuario
        //passar um product em arguments e preciso da um valor inicial para ele
        //mesmo sendo vazio
        this._formData['price'] = '';
      }
    }
  }

  //atualiza a imagem do container com a Imagem da URL
  void _updateImageUrl() {
    if (isValidImageUrl(this._imageUrlControl.text)) {
      setState(() {});
    }
  }

  bool isValidImageUrl(String url) {
    bool startWithHttp = url.toLowerCase().startsWith('http://');
    bool startWithHttps = url.toLowerCase().startsWith('https://');

    bool endsWithPng = url.toLowerCase().endsWith('png');
    bool endsWithJpg = url.toLowerCase().endsWith('jpg');
    bool endsWithJpeg = url.toLowerCase().endsWith('jpeg');

    return (startWithHttp || startWithHttps) &&
        (endsWithPng || endsWithJpeg || endsWithJpg);
  }

  @override
  void dispose() {
    super.dispose();

    //Preço
    this._priceFocusNode.dispose();

    //descrição
    this._descriptionFocusNode.dispose();

    //Imagem
    this._imageUrlFocusNode.removeListener(_updateImageUrl);
    this._imageUrlFocusNode.dispose();
  }

  void _saveForm() async {
    var isValid = this._form.currentState.validate();

    //se tiver campo invalidos continua na Page atual
    if (!isValid) {
      return;
    } else {
      //o metodo save so pode ser execultado depois do validate
      this._form.currentState.save();

      //cria um objeto com o novo produto a ser cadastrado no provider Products
      final product = Product(
        id: this._formData['id'],
        title: this._formData['title'],
        description: this._formData['description'],
        price: this._formData['price'],
        imageUrl: this._formData['imageUrl'],
      );

      //Ativa no body a area de carregamento informando
      //que os dados estão sendo processados
      setState(() => this._isLoading = true);

      final providerProducts = Provider.of<Products>(context, listen: false);

      try {
        //se o App informar o Id do Product ele atualiza se não ele cadastra
        if (this._formData['id'] == null) {
          await providerProducts.addProduct(product);
        } else {
          await providerProducts.updateProduct(product);
        }

        //quando terminado o cadastro ele fecha a tela
        Navigator.of(context).pop();
      } catch (erro) {
        print("Foi");
        //AlertDialog informando que houve um erro no cadastro
        await showDialog<Null>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text("Ocorreu um erro!"),
            content: Text("Ocorreu um erro para salvar o produto!"),
            actions: [
              FlatButton(
                child: Text("Fechar"),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          ),
        ); //showDialog
      } finally {
        //no final do processo tendo ou não cadastrado o
        //produto ele desativa a tela de processando dados
        setState(() => this._isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: AppBar(
        title: Text("Formulario Produto"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => this._saveForm(),
          )
        ],
      ),

      //Body
      body:
          //tem algum dado sendo processado ?
          this._isLoading
              ?
              //se sim
              Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 25),
                      Text("Processando dados...")
                    ],
                  ),
                )
              :
              //se não
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                    key: this._form,
                    //Lista de campos a serem preenchidos no Formulario
                    child: ListView(
                      children: [
                        //Nome do produto (titulo)
                        TextFormField(
                          initialValue: this._formData['title'],
                          autofocus: true,
                          decoration: InputDecoration(labelText: 'Titulo'),
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) => FocusScope.of(context)
                              .requestFocus(this._priceFocusNode),
                          onSaved: (value) => this._formData['title'] = value,
                          validator: (value) {
                            bool isEmpty = value.trim().isEmpty;
                            bool isValid = value.trim().length < 3;

                            if (isEmpty) {
                              return 'Informe um título válido';
                            }
                            if (isValid) {
                              return 'Informe um título com no minimo 3 letras!';
                            }
                            return null;
                          },
                        ),

                        //Preço do produto
                        TextFormField(
                          initialValue: this._formData['price'].toString(),
                          focusNode: this._priceFocusNode,
                          decoration: InputDecoration(labelText: 'Preço'),
                          textInputAction: TextInputAction.next,
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          onFieldSubmitted: (_) => FocusScope.of(context)
                              .requestFocus(this._descriptionFocusNode),
                          //salva o texto dentro do TextFormField no Map _formData
                          onSaved: (value) =>
                              this._formData['price'] = double.parse(value),
                          validator: (value) {
                            var newPrice = double.tryParse(value);
                            bool isValid = newPrice == null || newPrice <= 0;
                            if (isValid) {
                              return 'Informe um preço válido';
                            }
                            return null;
                          },
                        ),

                        //Descrição do produto
                        TextFormField(
                          initialValue: this._formData['description'],
                          decoration: InputDecoration(labelText: 'Descrição'),
                          maxLines: 3,
                          keyboardType: TextInputType.multiline,
                          focusNode: this._descriptionFocusNode,
                          onSaved: (value) =>
                              this._formData['description'] = value,
                          validator: (value) {
                            bool isEmpty = value.trim().isEmpty;
                            bool isValid = value.trim().length < 10;

                            if (isEmpty) {
                              return 'Insira uma descrição valida';
                            }
                            if (isValid) {
                              return 'Insira uma descrição valida de pelo menos 10 letras';
                            }
                            return null;
                          },
                        ),

                        //URL da imagem
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            //form de entrada da Url da imagem
                            Expanded(
                              child: TextFormField(
                                decoration:
                                    InputDecoration(labelText: 'URL da Imagem'),
                                keyboardType: TextInputType.url,
                                textInputAction: TextInputAction.done,
                                focusNode: this._imageUrlFocusNode,
                                controller: this._imageUrlControl,
                                onFieldSubmitted: (_) {
                                  this._saveForm();
                                },
                                onSaved: (value) =>
                                    this._formData['imageUrl'] = value,
                                validator: (value) {
                                  bool emptyUrl = value.trim().isEmpty;
                                  bool invalidUrl = !isValidImageUrl(value);
                                  if (emptyUrl || invalidUrl) {
                                    return 'Informe uma URL valida';
                                  }
                                  return null;
                                },
                              ),
                            ),

                            //Container com a imagem da Url
                            Container(
                              margin: EdgeInsets.only(
                                top: 8,
                                left: 10,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                              width: 100,
                              height: 100,
                              alignment: Alignment.center,
                              child: this._imageUrlControl.text.isEmpty
                                  ? Text("Informe a URL")
                                  : Image.network(
                                      _imageUrlControl.text,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }
}
