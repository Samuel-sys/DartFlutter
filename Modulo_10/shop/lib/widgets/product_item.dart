import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/product.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/utils/app_routes.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.pushNamed(
        context,
        AppRoutes.PRODUCT_DETAIL,
        arguments: product,
      ),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(product.title),
      trailing: Container(
          width: 100,
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.PRODUCTS_FORM,
                    arguments: product,
                  );
                },
                icon: Icon(Icons.edit),
                color: Theme.of(context).primaryColor,
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text("Tem certeza?"),
                      content: Text(
                        "Tem certeza que você quer deletar " +
                            "o produto:\n ${product.title}?",
                        textAlign: TextAlign.center,
                      ),
                      actions: [
                        FlatButton(
                          child: Text("SIM"),
                          onPressed: () {
                            Provider.of<Products>(context, listen: false)
                                .deletedProduct(product, context);

                            //fecha o AlertDialog
                            Navigator.of(ctx).pop();
                          },
                        ),
                        FlatButton(
                          child: Text("NÃO"),
                          onPressed: () => Navigator.of(ctx).pop(),
                        ),
                      ],
                    ),
                  );
                },
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
              ),
            ],
          )),
    );
  }
}
