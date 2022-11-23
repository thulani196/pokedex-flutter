import 'package:flutter/material.dart';
import '../models/pokemon_model.dart';
import 'card.dart';

class PokemonGrid extends StatefulWidget {
  final List<PokemonModel> pokemon;
  const PokemonGrid({Key? key, required this.pokemon}) : super(key: key);

  @override
  State<PokemonGrid> createState() => _PokemonGridState();
}

class _PokemonGridState extends State<PokemonGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 4,
      mainAxisSpacing: 4,
      childAspectRatio: 200 / 244,
      children: widget.pokemon
          .map(
            (pokemon) => PokemonCard(pokemon: pokemon),
          )
          .toList(),
    );
  }
}
