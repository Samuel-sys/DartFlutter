import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import '../models/category.dart';
import '../screens/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  void _selectCategory(BuildContext context) {
    // O Navigator e responsável por fazer as transições entre as paginas
    Navigator.of(context)

        //dentro do push se entrega a rota da nova pagina a ser apresentada
        .push(
      //com o MaterialPage você pode incrementar ainda mais a sua pagina
      //dando a ela estilos e funções diferentes
      MaterialPageRoute(
        builder: (_) {
          return CategoriesMealsScreen(category);
        },
      ),
    );
  }

  const CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    //otimização
    final borderRadius = BorderRadius.circular(5);
    final theme = Theme.of(context);

    return InkWell(
      onTap: () => this._selectCategory(context),
      borderRadius: borderRadius,
      splashColor: theme.primaryColor,
      child: Container(
        child: Text(
          category.title,
          style: theme.textTheme.headline6,
        ),

        //estilo do Container
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5),
              category.color,
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(10),
      ),
    );
  }
}

/*
 * O parâmetro 'decoration' do Container se executado objeto BoxDecoration
 * tem o parâmetro colors onde vc pode definir um gradiente de múltiplas cores
 * (Obrigatório o uso de pelo menos 2 cores para a execução)
 */
