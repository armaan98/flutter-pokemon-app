import 'package:flutter/material.dart';
import 'package:pokemon/screens/home.dart';
import 'package:pokemon/screens/pokemon_screen.dart';

Map routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => HomeScreen(),
  "/pokemon": (BuildContext context) => PokemonScreen(),
};
