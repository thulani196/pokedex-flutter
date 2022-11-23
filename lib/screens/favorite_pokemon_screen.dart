import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/favorites/favorite_state.dart';
import '../bloc/favorites/favorite_bloc.dart';
import '../widgets/pokemon_grid.dart';

class FavoritePokemonsScreen extends StatefulWidget {
  const FavoritePokemonsScreen({super.key});

  @override
  State<FavoritePokemonsScreen> createState() => _FavoritePokemonsScreenState();
}

class _FavoritePokemonsScreenState extends State<FavoritePokemonsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(builder: (context, state) {
      switch (state.status) {
        case FavoriteStatus.failure:
          return const Center(
              child: Text('failed to fetch favorite pokimones'));
        case FavoriteStatus.success:
          if (state.pokemons.isEmpty) {
            return const Center(
              child: Text("You do not have any favorites."),
            );
          } else {
            return PokemonGrid(
              pokemon: state.pokemons,
            );
          }
        case FavoriteStatus.initial:
          return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
