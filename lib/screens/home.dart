import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pokemon/data/pokemon_list_scoped_model.dart';
import 'package:pokemon/screens/pokemon_screen.dart';
import 'package:pokemon/widgets/custom_card.dart';
import 'package:pokemon/widgets/custom_loader.dart';

import 'package:scoped_model/scoped_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PokemonListModel pokemonListModel = PokemonListModel();

  @override
  initState() {
    super.initState();
    pokemonListModel.getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text('Pokemon World')),
        body: ScopedModel<PokemonListModel>(
            model: pokemonListModel,
            child: ScopedModelDescendant<PokemonListModel>(
              builder:
                  (BuildContext context, Widget child, PokemonListModel model) {
                return model.isLoading
                    ? Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              const Color(0xFF000000),
                              const Color(0xFFFFB74D),
                              const Color(0xFF000000),
                            ],
                            tileMode: TileMode
                                .clamp, // repeats the gradient over the canvas
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 200.0,
                            ),
                            Text(
                              "Pokemon World",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 30.0),
                            ),
                            SizedBox(
                              height: 200.0,
                            ),
                            Container(
                                height: 150.0,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: model.pokemonList.results.length,
                                    itemBuilder:
                                        (BuildContext context, int index) =>
                                            InkWell(
                                              onTap: () {
                                                model.setPokemon(model
                                                    .pokemonList
                                                    .results[index]
                                                    .name);

                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            PokemonScreen(
                                                              listModelInstance:
                                                                  model,
                                                            )));
                                              },
                                              child: CustomCard(model
                                                  .pokemonList
                                                  .results[index]
                                                  .name),
                                            ))),
                          ],
                        ),
                      )
                    : Scaffold(
                        body: Center(
                          child: CustomLoader(),
                        ),
                        backgroundColor: Colors.cyan,
                      );
              },
            )));
  }
}
