import 'package:equatable/equatable.dart';

import '../../models/pokemon_model.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class GetFavorites extends FavoriteEvent {}

class AddToFavorites extends FavoriteEvent {
  final PokemonModel pokemon;

  const AddToFavorites({required this.pokemon});
}

class RemoveFromFavorites extends FavoriteEvent {
  final PokemonModel pokemon;

  const RemoveFromFavorites({required this.pokemon});
}
