import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/utils/app_routes.dart';

/*
   * O AppRoutes e utilizado para padronizar e facilitar o gerenciamento
   * e manutenção de muitas rotas
   */

final routesPages = {
  AppRoutes.HOME: (_) => CategoriesScreen(), //pagina home

  AppRoutes.CATEGORIES_MEALS: (_) => CategoriesMealsScreen(),
};
