import '../models/pokemon_model.dart';

abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoadInProgress extends PokemonState {}

class FavoriteSuccess extends PokemonState {}

class FavoriteRemovalSuccess extends PokemonState {}

class PokemonLoadSuccess extends PokemonState {
  final List<PokemonModel> pokemonListings;

  PokemonLoadSuccess({required this.pokemonListings});
}

class FavoritePokemonsLoadSuccess extends PokemonState {
  final List<PokemonModel> pokemonListings;

  FavoritePokemonsLoadSuccess({required this.pokemonListings});
}

class PokemonLoadFailed extends PokemonState {
  final String error;

  PokemonLoadFailed({required this.error});
}
