import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  //Container com o Titulo da pagina
  Widget _createSectionTitle(BuildContext context, String title) {
    //titulo Ingredientes
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  //container da lista de ingredientes e de passos
  Widget _createContainer({Widget child}) {
    return Container(
      width: 330,
      height: 250,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),

      //lista de ingredientes
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as Meal;

    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(meal.title),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            //imagem
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),

            //metodo que cria o Title da pagina
            this._createSectionTitle(context, "Ingredentes"),

            //ingredientes
            this._createContainer(
              child: ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    color: theme.accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(meal.ingredients[index]),
                    ),
                  );
                },
              ),
            ),

            //passo
            this._createSectionTitle(context, "Passo"),

            this._createContainer(
              child: ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text("${index + 1}"),
                        ),
                        title: Text(meal.steps[index]),
                      ),

                      //divisor de itens
                      Divider(),
                    ],
                  );
                },
              ),
            ),
            //espaçamento
          ],
        ),
      ),

      //button Favorito
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.star),
        onPressed: () {
          Navigator.of(context).pop(meal.title);
        },
      ),

      //espaçamento
    );
  }
}
