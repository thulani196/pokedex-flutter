import 'package:pokedex/repositories/pokemon_service.dart';

import '../models/pokemon_model.dart';
import 'pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  PokemonService service = PokemonService();

  @override
  Future<List<PokemonModel>> getPokemons() {
    return service.getPokemons();
  }

  @override
  Future<List<PokemonModel>> getFavorites() {
    return service.getFavorites();
  }

  @override
  Future<List<PokemonModel>> addToFavorites(PokemonModel pokemon) {
    return service.addToFavorites(pokemon);
  }

  @override
  Future<List<PokemonModel>> removeFromFavorites(PokemonModel pokemon) {
    return service.removeFromFavorites(pokemon);
  }
}
