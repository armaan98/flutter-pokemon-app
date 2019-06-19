import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pokemon/data/pokemon_list_scoped_model.dart';
import 'package:pokemon/data/pokemon_scoped_model.dart';
import 'package:pokemon/models/pokemon_model.dart';
import 'package:pokemon/widgets/custom_loader.dart';
import 'package:pokemon/widgets/loader.dart';
import 'package:scoped_model/scoped_model.dart';

class PokemonScreen extends StatefulWidget {
  PokemonListModel listModelInstance;

  PokemonScreen({this.listModelInstance});

  @override
  _PokemonScreenState createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  PokemonModel pokemon = PokemonModel();

  @override
  initState() {
    super.initState();
    pokemon.getPokemon(widget.listModelInstance.selectedPokemon);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title:
                Text(widget.listModelInstance.selectedPokemon.toUpperCase())),
        backgroundColor: Colors.lime,
        body: ScopedModel<PokemonModel>(
            model: pokemon,
            child: ScopedModelDescendant<PokemonModel>(builder:
                (BuildContext context, Widget child, PokemonModel model) {
              return model.isLoading
                  ? Container(
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 100.0,
                            ),
                            Text(
                              " ${model.pokemon.name.toUpperCase()}",
                              style: TextStyle(
                                  fontSize: 30.0, fontStyle: FontStyle.italic),
                            ),
                            SizedBox(
                              height: 100.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text(
                                  "Weight => ${model.pokemon.weight.toString()}",
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                Text(
                                  "Height => ${model.pokemon.height.toString()}",
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  : Scaffold(
                      body: Center(
                        child: ColorLoader(),
                      ),
                      backgroundColor: Colors.deepPurple,
                    );
            })));
  }
}
