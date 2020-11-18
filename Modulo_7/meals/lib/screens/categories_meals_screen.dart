import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final List<Meal> meals;
  const CategoriesMealsScreen(this.meals);

  @override
  Widget build(BuildContext context) {
    //pegando o Objeto que informa a categoria de receitas a serem apresentados
    final category = ModalRoute.of(context).settings.arguments as Category;

    final categoryMeals = meals.where(
      (meal) => meal.categories.contains(category.id),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Receitas: ${category.title}"),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: categoryMeals.length,
            itemBuilder: (ctx, index) {
              return Container(
                child: MealItem(categoryMeals.elementAt(index)),
              );
            }),
      ),
    );
  }
}
