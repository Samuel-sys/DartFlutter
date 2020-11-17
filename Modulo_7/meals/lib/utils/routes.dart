import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/utils/app_routes.dart';

/*
   * O AppRoutes e utilizado para padronizar e facilitar o gerenciamento
   * e manutenção de muitas rotas
   */

final routesPages = {
  AppRoutes.HOME: (_) => TabsScreen(), //pagina home

  AppRoutes.CATEGORIES_MEALS: (_) => CategoriesMealsScreen(),

  AppRoutes.MEAL_DETAILS: (_) => MealDetailsScreen(),
};
