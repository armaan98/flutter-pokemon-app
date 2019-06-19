import 'package:pokemon/config/config.dart';
import 'package:pokemon/models/pokemon_model.dart';
import 'package:pokemon/services/api_service.dart';
import 'package:scoped_model/scoped_model.dart';

class PokemonModel extends Model {
  PokemonDetails _pokemon = PokemonDetails();
  PokemonDetails get pokemon => _pokemon;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setloadingData(bool load) {
    print(load);
    _isLoading = load;
    notifyListeners();
  }

  getPokemon(String name) async {
    print("here => $name");
    _pokemon = PokemonDetails.fromJson(
        await Api.getRequest(config['BASE_URL'] + "$name"));
    print(_pokemon.name);
    setloadingData(true);
  }
}
