import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(category.title),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5),
              category.color,
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight,
          )),
    );
  }
}

/*
 * O parâmetro 'decoration' do Container se executado objeto BoxDecoration
 * tem o parâmetro colors onde vc pode definir um gradiente de múltiplas cores
 * (Obrigatório o uso de pelo menos 2 cores para a execução)
 */
