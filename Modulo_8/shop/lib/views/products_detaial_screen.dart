import 'package:flutter/material.dart';
import 'package:shop/providers/product.dart';

class ProductDetaialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product product =
        ModalRoute.of(context).settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(product.title),
      ),

      //body
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Imagem do produto
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),

            //espaçamento
            SizedBox(height: 10),

            //Preço do produto
            Text(
              'R\$${product.price}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),

            //espaçamento
            SizedBox(height: 10),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                product.description,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
