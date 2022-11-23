import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/pokemon_repository.dart';
import 'favorite_event.dart';
import 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final PokemonRepository _pokemonRepository;

  FavoriteBloc(this._pokemonRepository) : super(FavoriteInitial()) {
    on<FavoriteEvent>((event, emit) async {
      if (event is GetFavorites) {
        emit(FavoriteLoadInProgress());
        try {
          var favorites = await _pokemonRepository.getFavorites();
          emit(TotalFavorites(totalFavorites: favorites.length));
          emit(FavoriteLoadSuccess(favoriteListings: favorites));
        } on Exception {
          emit(FavoriteLoadFailed(
              error: 'an error occurred while fetching Favorites.'));
        }
      }

      if (event is AddToFavorites) {
        try {
          var favorites =
              await _pokemonRepository.addToFavorites(event.pokemon);
          emit(TotalFavorites(totalFavorites: favorites.length));
          emit(FavoriteLoadSuccess(favoriteListings: favorites));
        } on Exception {
          emit(FavoritesError(
              error: 'an error occurred while adding Favorite to favorites.'));
        }
      }

      if (event is RemoveFromFavorites) {
        try {
          var favorites =
              await _pokemonRepository.removeFromFavorites(event.pokemon);
          emit(TotalFavorites(totalFavorites: favorites.length));
          emit(FavoriteLoadSuccess(favoriteListings: favorites));
        } on Exception {
          emit(FavoritesError(
              error: 'an error occurred while adding Favorite to favorites.'));
        }
      }
    });
  }
}
