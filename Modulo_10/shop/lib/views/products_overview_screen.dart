import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:shop/widgets/app_drawer.dart';
import 'package:shop/widgets/badge.dart';
import 'package:shop/widgets/product_grid.dart';

enum FilterOptions {
  Favorite,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  //lista de produtos

  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool showFavoriteOnly = false;

  Future<void> refreshProducts(context) {
    return Provider.of<Products>(context, listen: false).loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        //appBar
        appBar: AppBar(
          centerTitle: true,
          title: Text("Minha Loja"),

          //actions
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (FilterOptions selectValue) {
                //seta a opção do cliente
                switch (selectValue) {
                  case FilterOptions.All:
                    setState(() => showFavoriteOnly = false);
                    break;
                  case FilterOptions.Favorite:
                    setState(() => showFavoriteOnly = true);
                    break;
                }
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: Text("Somente favoritos"),
                  value: FilterOptions.Favorite,
                ),
                PopupMenuItem(
                  child: Text("Todos"),
                  value: FilterOptions.All,
                ),
              ],
            ),

            //carrinho de compra
            Consumer<Cart>(
              builder: (_, cart, chiel) =>
                  //informa quantidade de itens no carrinho
                  Badge(
                value: cart.itemsCount.toString(),
                child:

                    //icon do carrinho
                    IconButton(
                  icon: Icon(Icons.shopping_cart),

                  //evento
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.CART);
                  },
                ),
              ),
            ),
          ],
        ),

        //body
        body: FutureBuilder(
          future: Provider.of<Products>(context, listen: false).loadProducts(),
          builder: (context, snapshot) {
            //caso esteja carregando os itens ainda ele executa esse bloco de comando
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            //caso de um erro ele executa esse bloco de comandos
            else if (snapshot.error != null) {
              return Center(
                  child: Text("Ocoreu um erro ao processar os dados..."));
            }

            //quando tiver carregado a tela ele carrega esse bloco de comandos
            else {
              return RefreshIndicator(
                //metodo para atualizar os dados do App com o da API
                onRefresh: () => refreshProducts(context),

                //entrega uma lista de produtos em um formato visual (Widget)
                child: ProducGrid(this.showFavoriteOnly),
              );
            }
          },
        ));
  }
}
