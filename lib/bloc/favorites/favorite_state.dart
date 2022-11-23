import '../../models/pokemon_model.dart';

abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoadInProgress extends FavoriteState {}

class FavoriteSuccess extends FavoriteState {}

class FavoriteRemovalSuccess extends FavoriteState {}

class TotalFavorites extends FavoriteState {
  final int totalFavorites;

  TotalFavorites({required this.totalFavorites});
}

class FavoriteLoadSuccess extends FavoriteState {
  final List<PokemonModel> favoriteListings;

  FavoriteLoadSuccess({required this.favoriteListings});
}

class FavoriteFavoritesLoadSuccess extends FavoriteState {
  final List<PokemonModel> favoriteListings;

  FavoriteFavoritesLoadSuccess({required this.favoriteListings});
}

class FavoriteLoadFailed extends FavoriteState {
  final String error;

  FavoriteLoadFailed({required this.error});
}

class FavoritesError extends FavoriteState {
  final String error;

  FavoritesError({required this.error});
}
