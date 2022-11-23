import '../models/pokemon_model.dart';

abstract class PokemonRepository {
  Future<List<PokemonModel>> getPokemons({required bool isFirstTime});
  Future<List<PokemonModel>> getFavorites();
  Future<List<PokemonModel>> addToFavorites(PokemonModel pokemon);
  Future<List<PokemonModel>> removeFromFavorites(PokemonModel pokemon);
}
