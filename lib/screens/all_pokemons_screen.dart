import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/pokemon_bloc.dart';
import '../bloc/pokemon_state.dart';
import '../widgets/pokemon_grid.dart';

class AllPokemonsScreen extends StatefulWidget {
  const AllPokemonsScreen({super.key});

  @override
  State<AllPokemonsScreen> createState() => _AllPokemonsScreenState();
}

class _AllPokemonsScreenState extends State<AllPokemonsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonBloc, PokemonState>(builder: (context, state) {
      if (state is PokemonLoadInProgress) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is PokemonLoadSuccess) {
        return PokemonGrid(
          pokemon: state.pokemonListings,
        );
      } else if (state is PokemonLoadFailed) {
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
