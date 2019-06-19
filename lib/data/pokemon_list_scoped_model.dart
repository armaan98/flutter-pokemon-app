import 'package:pokemon/config/config.dart';
import 'package:pokemon/models/pokemon_list_model.dart';
import 'package:pokemon/services/api_service.dart';
import 'package:scoped_model/scoped_model.dart';

class PokemonListModel extends Model {
  PokemonList _pokemonList = PokemonList();
  PokemonList get pokemonList => _pokemonList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String _pokemon;
  String get selectedPokemon => _pokemon;

  setloadingData(bool load) {
    _isLoading = load;
    notifyListeners();
  }

  setPokemon(String name) {
    _pokemon = name;
  }

  getList() async {
    var output = await Api.getRequest(config['BASE_URL']);
    _pokemonList = PokemonList.fromJson(output);
    print(_pokemonList);
    setloadingData(true);
  }
}
