import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/product.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/widgets/product_item.dart';

class ProducGrid extends StatelessWidget {
  final bool showFavoriteOnly;

  ProducGrid(this.showFavoriteOnly);

  @override
  Widget build(BuildContext context) {
    //endereço para o Provider
    final providerProducts = Provider.of<Products>(context);

    //recebe a lista de produtos (conforme a escolha do usuario)
    final List<Product> products = showFavoriteOnly
        ? providerProducts.favoriteItems //lista de favoritos
        : providerProducts.items; //lista com todos os items

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
