import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductFormScreen extends StatefulWidget {
  @override
  _ProductFormScreenState createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlFocusNode = FocusNode();
  final _imageUrlControl = TextEditingController();

  //cria um Listener para a o _imageUrlFocusNode no inicio do State da pagina
  @override
  void initState() {
    super.initState();

    this._imageUrlFocusNode.addListener(_updateImageUrl);
  }

  //atualiza a imagem do container com a Imagem da URL
  void _updateImageUrl() => setState(() {});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: AppBar(
        title: Text("Formulario Produto"),
        centerTitle: true,
      ),

      //Body
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
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
              ),

              //Preço do produto
              TextFormField(
                focusNode: this._priceFocusNode,
                decoration: InputDecoration(labelText: 'Preço'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onFieldSubmitted: (_) => FocusScope.of(context)
                    .requestFocus(this._descriptionFocusNode),
              ),

              //Descrição do produto
              TextFormField(
                decoration: InputDecoration(labelText: 'Descrição'),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: this._descriptionFocusNode,
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
