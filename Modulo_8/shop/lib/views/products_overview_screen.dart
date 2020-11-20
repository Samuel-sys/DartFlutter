import 'package:flutter/material.dart';
import 'package:shop/widgets/product_grid.dart';

enum FilterOptions { Favorite, All }

class ProductOverviewScreen extends StatefulWidget {
  //lista de produtos

  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  bool showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    )
                  ])
        ],
      ),

      //body
      body: ProducGrid(this.showFavoriteOnly),
    );
  }
}
