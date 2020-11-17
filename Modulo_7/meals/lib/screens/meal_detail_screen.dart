import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as Meal;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(meal.title),
        ),
        body: Center(
          child: Text("Detalhes da Refeição"),
        ));
  }
}
