import 'package:equatable/equatable.dart';

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];
}

class GetPokemons extends PokemonEvent {
  final bool isFirstTime;

  const GetPokemons({required this.isFirstTime});
}
