import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/widgets/product_item.dart';

class ProducGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //endereço para o Provider
    final providerProducts = Provider.of<Products>(context);

    //recebe a lista de produtos atraves de um
    final List<Product> products = providerProducts.items;

    return GridView.builder(
      itemCount: products.length,
      itemBuilder: (ctx, i) {
        return ChangeNotifierProvider.value(
          //pasando o produto pelo Provaider
          value: products[i],
          //por ser um ChangeNotifierProvider.value ele não precisa ser passado
          //com uma function ele transfere diretamente um valor associado a ele

          child: ProductItem(),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
