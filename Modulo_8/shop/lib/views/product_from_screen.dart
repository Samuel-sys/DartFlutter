import 'dart:math';

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

  //cria um Listener para a o _imageUrlFocusNode no inicio do State da pagina
  @override
  void initState() {
    super.initState();

    this._imageUrlFocusNode.addListener(_updateImageUrl);
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

  void _saveForm() {
    var isValid = this._form.currentState.validate();

    if (!isValid) {
      return;
    } else {
      //o metodo save so pode ser execultado depois do validate
      this._form.currentState.save();

      //cria um objeto com o novo produto a ser cadastrado no provider Products
      final newProduct = Product(
        title: this._formData['title'],
        description: this._formData['description'],
        price: this._formData['price'],
        imageUrl: this._formData['imageUrl'],
      );

      Provider.of<Products>(context, listen: false).addProduct(newProduct);

      //Quando o cadastro tiver sido terminado
      //ele sai do form de cadastro de produto
      Navigator.of(context).pop();
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: this._form,
          //Lista de campos a serem preenchidos no Formulario
          child: ListView(
            children: [
              //Nome do produto (titulo)
              TextFormField(
                autofocus: true,
                decoration: InputDecoration(labelText: 'Titulo'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(this._priceFocusNode),
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
                focusNode: this._priceFocusNode,
                decoration: InputDecoration(labelText: 'Preço'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
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
                decoration: InputDecoration(labelText: 'Descrição'),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: this._descriptionFocusNode,
                onSaved: (value) => this._formData['description'] = value,
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
                      decoration: InputDecoration(labelText: 'URL da Imagem'),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      focusNode: this._imageUrlFocusNode,
                      controller: this._imageUrlControl,
                      onFieldSubmitted: (_) {
                        this._saveForm();
                      },
                      onSaved: (value) => this._formData['imageUrl'] = value,
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
