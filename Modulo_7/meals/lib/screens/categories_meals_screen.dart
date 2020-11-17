import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //pegando o
    final category = ModalRoute.of(context).settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Receitas"),
      ),
      body: Center(
        child: Text("Receitas por Categoria ${category.title}"),
      ),
    );
  }
}
