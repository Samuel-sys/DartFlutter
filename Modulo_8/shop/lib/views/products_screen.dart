import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/utils/app_routes.dart';
import 'package:shop/widgets/app_drawer.dart';
import 'package:shop/widgets/product_item.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final providerProducts = Provider.of<Products>(context);
    final listProducts = Provider.of<Products>(context).items;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Gerenciar Produtos"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () =>
                Navigator.of(context).pushNamed(AppRoutes.PRODUCTS_FORM),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: providerProducts.itemsCount,
          itemBuilder: (ctx, index) => Column(
            children: [
              ProductItem(listProducts[index]),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
