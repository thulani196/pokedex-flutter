import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositories/pokemon_repository.dart';
import 'pokemon_event.dart';
import 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonRepository _pokemonRepository;

  PokemonBloc(this._pokemonRepository) : super(PokemonInitial()) {
    on<PokemonEvent>((event, emit) async {
      if (event is GetPokemons) {
        emit(PokemonLoadInProgress());
        try {
          var pokemons = await _pokemonRepository.getPokemons();
          emit(PokemonLoadSuccess(pokemonListings: pokemons));
        } on Exception {
          emit(PokemonLoadFailed(
              error: 'an error occurred while fetching pokemons.'));
        }
      }
    });
  }
}
