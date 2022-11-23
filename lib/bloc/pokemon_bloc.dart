import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/pokemon_model.dart';
import '../repositories/pokemon_repository.dart';
import 'pokemon_event.dart';
import 'pokemon_state.dart';
// ignore: depend_on_referenced_packages
import 'package:stream_transform/stream_transform.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final PokemonRepository _pokemonRepository;
  final List<PokemonModel> pokemonListings = [];

  PokemonBloc(this._pokemonRepository) : super(const PokemonState()) {
    on<PokemonEvent>((event, emit) async {
      if (event is GetPokemons) {
        try {
          if (state.status == PokemonStatus.initial) {
            var pokemons = await _pokemonRepository.getPokemons(
                isFirstTime: event.isFirstTime);
            return emit(state.copyWith(
              status: PokemonStatus.success,
              pokemons: pokemons,
              hasReachedMax: false,
            ));
          }

          var pokemons = await _pokemonRepository.getPokemons(
              isFirstTime: event.isFirstTime);

          pokemons.isEmpty
              ? emit(state.copyWith(hasReachedMax: true))
              : emit(
                  state.copyWith(
                    status: PokemonStatus.success,
                    pokemons: List.of(state.pokemons)..addAll(pokemons),
                    hasReachedMax: false,
                  ),
                );
        } catch (e) {
          emit(state.copyWith(status: PokemonStatus.failure));
        }
      }
    }, transformer: throttleDroppable(throttleDuration));
  }
}
