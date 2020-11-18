import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/utils/app_routes.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem(this.meal);

  //metodo que entra na outra pagina
  void _selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.MEAL_DETAILS,
      arguments: meal,
    );
  }

  @override
  Widget build(BuildContext context) {
    //otimização
    final borderRadius = BorderRadius.circular(15);
    //no caso da imagem por ter de ser uma ponta circular e não as 4
    //se coloca no final um parâmetro que informe a posição
    //.topRight (sendo do lado direito em cima)

    final theme = Theme.of(context);

    return InkWell(
      //eventos
      onTap: () => this._selectMeal(context),
      borderRadius: borderRadius,
      splashColor: theme.primaryColor,

      child: Card(
        //estilo do container
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            //Imagem e titulo
            Stack(
              children: <Widget>[
                //imagem
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: borderRadius.topLeft,
                    topRight: borderRadius.topRight,
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                //Titulo
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      meal.title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true, //quebra de linha automatica
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),

            //Características da receita
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  //tempo
                  Row(
                    children: [
                      Icon(Icons.schedule),

                      SizedBox(width: 6), //espaçamento

                      Text('${meal.duration} min'),
                    ],
                  ),

                  //complexidade
                  Row(
                    children: [
                      Icon(Icons.work),

                      SizedBox(width: 6), //espaçamento

                      Text(meal.complexityText),
                    ],
                  ),

                  //custo
                  Row(
                    children: [
                      Icon(Icons.attach_money),

                      SizedBox(width: 6), //espaçamento

                      Text(meal.costText),
                    ],
                  ),

                  //espaçamento
                ],
              ),
            ),

            //espaçamento
          ],
        ),
      ),
    );
  }
}
