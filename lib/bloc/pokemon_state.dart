import 'package:equatable/equatable.dart';

import '../models/pokemon_model.dart';

enum PokemonStatus { initial, success, failure }

class PokemonState extends Equatable {
  final List<PokemonModel> pokemons;
  final PokemonStatus status;
  final bool hasReachedMax;

  const PokemonState({
    this.pokemons = const <PokemonModel>[],
    this.status = PokemonStatus.initial,
    this.hasReachedMax = false,
  });

  PokemonState copyWith({
    PokemonStatus? status,
    List<PokemonModel>? pokemons,
    bool? hasReachedMax,
  }) {
    return PokemonState(
      status: status ?? this.status,
      pokemons: pokemons ?? this.pokemons,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''PokemonState { status: $status, hasReachedMax: $hasReachedMax, pokemons: ${pokemons.length} }''';
  }

  @override
  List<Object?> get props => [status, pokemons, hasReachedMax];
}
