import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/settings.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/settings_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/utils/app_routes.dart';

import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //lista de meals favoritados
  List<Meal> _favoriteMeals = [];

  //lista de Meals
  List<Meal> _availableMeals = DUMMY_MEALS;

  //configurações inicias do Sistema
  Settings settings = Settings();

  void _filterMeal(Settings settings) {
    //atualiza a lista de alimentos
    setState(
      () {
        this.settings = settings;

        _availableMeals = DUMMY_MEALS.where((meal) {
          //se a comida tiver gluten e o usuario selecionou a opção de comida
          //sem gluten ele retorna false
          final gluten = settings.isGlutenFree && !meal.isGlutenFree;
          final lactose = settings.isLactoseFree && !meal.isLactoseFree;

          //se a comida for vegana e o usuario selecionar para aparecer apenas
          //comidas veganas retorna true
          final vegan = settings.isVegan && !meal.isVegan;
          final vegetarian = settings.isVegetarian && !meal.isVegetarian;

          return !gluten && !lactose && !vegan && !vegetarian;
        }).toList();
      },
    );
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      //se esse meal já existe na lista de favorito
      //deleta
      //se não
      //adiciona
      this._favoriteMeals.contains(meal)
          ? this._favoriteMeals.remove(meal)
          : this._favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) => this._favoriteMeals.contains(meal);

  final themeApp = ThemeData(
    primarySwatch: Colors.pink,
    accentColor: Colors.amber,
    fontFamily: "Raleway",
    canvasColor: Color.fromRGBO(255, 254, 229, 1),
    textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(
            fontSize: 20,
            fontFamily: "RobotoCondensed",
          ),
        ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deli Meals', theme: themeApp, //tema do app

      routes: {
        AppRoutes.HOME: (_) => TabsScreen(this._favoriteMeals),
        AppRoutes.CATEGORIES_MEALS: (_) =>
            CategoriesMealsScreen(this._availableMeals),
        AppRoutes.MEAL_DETAILS: (_) =>
            MealDetailsScreen(this._toggleFavorite, this._isFavorite),
        AppRoutes.SETTINGS: (_) =>
            SettingsScreen(this.settings, this._filterMeal),
      },
    );
  }
}
