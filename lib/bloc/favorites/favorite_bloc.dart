import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/pokemon_repository.dart';
import 'bloc.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final PokemonRepository _pokemonRepository;

  FavoriteBloc(this._pokemonRepository) : super(const FavoriteState()) {
    on<FavoriteEvent>((event, emit) async {
      if (event is GetFavorites) {
        try {
          if (state.status == FavoriteStatus.initial) {
            var favorites = await _pokemonRepository.getFavorites();

            emit(state.copyWith(
                status: FavoriteStatus.success,
                pokemons: favorites,
                totalFavorites: favorites.length));
          }
        } on Exception {
          emit(state.copyWith(status: FavoriteStatus.failure));
        }
      }

      if (event is AddToFavorites) {
        try {
          var favorites =
              await _pokemonRepository.addToFavorites(event.pokemon);
          emit(state.copyWith(
              status: FavoriteStatus.success,
              pokemons: favorites,
              totalFavorites: favorites.length));
        } on Exception {
          emit(state.copyWith(status: FavoriteStatus.failure));
        }
      }

      if (event is RemoveFromFavorites) {
        try {
          var favorites =
              await _pokemonRepository.removeFromFavorites(event.pokemon);
          emit(state.copyWith(
              status: FavoriteStatus.success,
              pokemons: favorites,
              totalFavorites: favorites.length));
        } on Exception {
          emit(state.copyWith(status: FavoriteStatus.failure));
        }
      }
    });
  }
}
