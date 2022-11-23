import 'package:equatable/equatable.dart';

import '../../models/pokemon_model.dart';

enum FavoriteStatus { initial, success, failure }

class FavoriteState extends Equatable {
  final List<PokemonModel> pokemons;
  final FavoriteStatus status;
  final int totalFavorites;

  const FavoriteState(
      {this.pokemons = const <PokemonModel>[],
      this.status = FavoriteStatus.initial,
      this.totalFavorites = 0});

  FavoriteState copyWith(
      {FavoriteStatus? status,
      List<PokemonModel>? pokemons,
      int? totalFavorites}) {
    return FavoriteState(
        status: status ?? this.status,
        pokemons: pokemons ?? this.pokemons,
        totalFavorites: totalFavorites ?? this.totalFavorites);
  }

  @override
  String toString() {
    return '''PokemonState { status: $status, pokemons: ${pokemons.length} }''';
  }

  @override
  List<Object?> get props => [status, pokemons];
}
