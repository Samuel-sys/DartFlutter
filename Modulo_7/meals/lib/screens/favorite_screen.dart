import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import 'package:meals/models/meal.dart';

class FavoriteScreen extends StatefulWidget {
  final List<Meal> favoriteMeal;

  FavoriteScreen(this.favoriteMeal);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favoriteMeal.isEmpty) {
      return Center(
        child: Text("Lista de refeições favoritss"),
      );
    } else {
      return ListView.builder(
        itemCount: widget.favoriteMeal.length,
        itemBuilder: (context, index) =>
            MealItem(widget.favoriteMeal[index], () => setState(() {})),
      );
    }
  }
}
