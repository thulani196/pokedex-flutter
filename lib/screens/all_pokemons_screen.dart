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
      switch (state.status) {
        case PokemonStatus.failure:
          return const Center(child: Text('failed to fetch pokimone'));
        case PokemonStatus.success:
          return PokemonGrid(
            pokemon: state.pokemons,
          );
        case PokemonStatus.initial:
          return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
