import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      //Imagem do produto
      child: Image.network(
        product.imageUrl,
        fit: BoxFit.cover,
      ),

      //Barra de funções do item (compra, favorita e etc)
      footer: GridTileBar(
        //cor da Bar
        backgroundColor: Colors.black87,

        //nome do produto
        title: Text(
          product.title,
          textAlign: TextAlign.center,
        ),

        //Favorite
        leading: IconButton(
          icon: Icon(Icons.favorite),
          onPressed: () {},
        ),

        //carrinho \ compra
        trailing: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {},
        ),

        //espaçamento
      ),
    );
  }
}
