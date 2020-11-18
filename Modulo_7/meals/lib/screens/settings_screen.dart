import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Settings) onSettingsChanged;

  const SettingsScreen(this.onSettingsChanged);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var settings = Settings();

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        //AppBar
        appBar: AppBar(
          centerTitle: true,
          title: Text("Configurações"),
        ),

        //Drawer
        drawer: MainDrawer(),

        //Body
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Configurações",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),

            //lista de configurações
            Expanded(
                child: ListView(
              children: <Widget>[
                //glutén
                _createSwitch(
                  "Sem Glutén",
                  "Só exibe refeições sem glúten!",
                  settings.isGlutenFree,
                  (value) => setState(() => settings.isGlutenFree = value),
                ),

                //lactose
                _createSwitch(
                  "Sem Lactose",
                  "Só exibe refeições sem lactose!",
                  settings.isLactoseFree,
                  (value) => setState(() => settings.isLactoseFree = value),
                ),

                //vegana
                _createSwitch(
                  "Vegana",
                  "Só exibe refeições Veganas!",
                  settings.isVegan,
                  (value) => setState(() => settings.isVegan = value),
                ),

                //vegetariana
                _createSwitch(
                  "Vegetariana",
                  "Só exibe refeições Vegetarianas!",
                  settings.isVegetarian,
                  (value) => setState(() => settings.isVegetarian = value),
                ),
              ],
            ))
          ],
        ));
  }
}
