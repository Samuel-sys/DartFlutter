import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  //lista de Meal favoritos
  final List<Meal> favoriteMeal;

  const TabsScreen(this.favoriteMeal);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  //lista de screens do App com todo os dados inicias
  List<Map<String, Object>> _screens;

  @override
  initState() {
    super.initState();
    _screens = [
      {
        'title': 'Lista de Categorias',
        'screen': CategoriesScreen(),
        'label': 'Categoria',
        'icon': Icon(Icons.category)
      },
      {
        'title': 'Meus Favoritos',
        'screen': FavoriteScreen(widget.favoriteMeal),
        'label': 'Favorito',
        'icon': Icon(Icons.star)
      },
    ];
  }

  //metodo para mudança de screens atravez do index da List com as instancias
  //das screens
  _selectSceen(int index) {
    //atualiza a tela e muda o index que orienta o app a apresentar a tela
    setState(() => _selectedScreenIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: this._screens.length, //quantidade de telas posiveis de se dar tab
      child: Scaffold(
        //AppBar
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            this._screens[_selectedScreenIndex]['title'], //titulo da tela
          ),
        ),

        drawer: MainDrawer(),

        //body
        body: this._screens[_selectedScreenIndex]['screen'], //instancia da tela

        //Tabs de navegação
        bottomNavigationBar: BottomNavigationBar(
          //conforme o tab precionado ele altera o valor da index que indica
          //a tela que foi selecionada
          onTap: this._selectSceen,
          backgroundColor: Theme.of(context).primaryColor,

          //cor dos icons selecionados e não selecionas
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,

          //index da tela selecionada pelo items
          currentIndex: this._selectedScreenIndex, //
          items:
              //automatizado caso deseje colocar mas uma tela no app bar basta
              //atualiza a List de screens
              this._screens.map((itemsScreens) {
            //cria um BottomNavigationBarItem para cada screen cadastrada
            return BottomNavigationBarItem(
              icon: itemsScreens['icon'],
              label: itemsScreens['label'],
            );
          }).toList(),
        ),
      ),
    );
  }
}
