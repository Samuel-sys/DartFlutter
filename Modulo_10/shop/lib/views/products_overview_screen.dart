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
  bool _isLoading = true;

  Future<void> refreshProducts(context) {
    return Provider.of<Products>(context, listen: false).loadProducts();
  }

  @override
  void initState() {
    super.initState();
    Provider.of<Products>(context, listen: false)
        .loadProducts()
        .then((value) => setState(() => this._isLoading = false));
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
      body: this._isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: () => refreshProducts(context),
              child: ProducGrid(this.showFavoriteOnly),
            ),
    );
  }
}
