import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/favorites/favorite_bloc.dart';
import '../bloc/favorites/favorite_state.dart';
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
      if (state is FavoriteLoadInProgress) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is FavoriteLoadSuccess) {
        return PokemonGrid(
          pokemon: state.favoriteListings,
        );
      } else if (state is FavoriteLoadFailed) {
        return Center(
          child: Text(state.error),
        );
      } else {
        return const Center(
          child: Text("error..."),
        );
      }
    });
  }
}
