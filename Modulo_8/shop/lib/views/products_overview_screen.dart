import 'package:flutter/material.dart';
import 'package:shop/widgets/product_grid.dart';

class ProductOverviewScreen extends StatelessWidget {
  //lista de produtos

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar
      appBar: AppBar(
        centerTitle: true,
        title: Text("Minha Loja"),
      ),

      //body
      body: ProducGrid(),
    );
  }
}
