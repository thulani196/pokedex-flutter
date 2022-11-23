import '../models/pokemon_model.dart';

abstract class PokemonRepository {
  Future<List<PokemonModel>> getPokemons();
  Future<List<PokemonModel>> getFavorites();
  Future<List<PokemonModel>> addToFavorites(PokemonModel pokemon);
  Future<List<PokemonModel>> removeFromFavorites(PokemonModel pokemon);
}
