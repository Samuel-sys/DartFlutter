import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  //recebe o objeto que define a categoria escolhida pelo cliente
  final Category category;

  const CategoriesMealsScreen(this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Receitas"),
      ),
      body: Center(
        child: Text("Receitas por Categoria ${this.category.title}"),
      ),
    );
  }
}
