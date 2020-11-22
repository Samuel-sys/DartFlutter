import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/product.dart';
import 'package:shop/utils/app_routes.dart';

class ProductGridItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //pegando um produto atravez do contex usando o Provider
    final Product product = Provider.of<Product>(
      context, //pasando o context atual do app
      listen:
          false, //informa se houver algum evento relacionado a esse provider
    );

    final Cart cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        //Imagem do produto
        child: GestureDetector(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),

          //transmição de tela (Detalhes do produto)
          onTap: () => Navigator.pushNamed(
            context,
            AppRoutes.PRODUCT_DETAIL,
            arguments: product,
          ),
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

          //dessa forma ele so permite que haja atualizações nesse trecho
          //do Widget fazendo assim uma otimização no App
          leading: Consumer<Product>(
            builder: (ctx, productConsumer, _) =>
                //Favorite
                IconButton(
              icon: Icon(productConsumer.isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border),
              //tira e coloca no favorite
              onPressed: () => productConsumer.toggleFavorite(),
              color: Theme.of(context).accentColor,
            ),
          ),

          //carrinho \ compra
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),

            //Add ou ou remove Item
            onPressed: () {
              //add o item a carrinho se já tiver no carrinho add mais um na qtd
              cart.addItem(product);

              //se tiver um SnackBar aberto ele fechar para exibir o proximo
              Scaffold.of(context).hideCurrentSnackBar();

              //questiona se o usuario realmente quer o produto
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text("${product.title} adicionado com sucesso!"),
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(
                    label: "DESFAZER",
                    onPressed: () => cart.removeSingleitem(product.id),
                  ),
                ),
              );
            },
            color: Theme.of(context).accentColor,
          ),

          //espaçamento
        ),
      ),
    );
  }
}
