import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc.dart';
import '../models/pokemon_model.dart';
import 'card.dart';

class PokemonGrid extends StatefulWidget {
  final List<PokemonModel> pokemon;
  const PokemonGrid({Key? key, required this.pokemon}) : super(key: key);

  @override
  State<PokemonGrid> createState() => _PokemonGridState();
}

class _PokemonGridState extends State<PokemonGrid> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    handleNext();
  }

  void handleNext() {
    scrollController.addListener(() async {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        BlocProvider.of<PokemonBloc>(context)
            .add(const GetPokemons(isFirstTime: false));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 4,
      mainAxisSpacing: 4,
      childAspectRatio: 200 / 244,
      controller: scrollController,
      children: widget.pokemon
          .map(
            (pokemon) => PokemonCard(pokemon: pokemon),
          )
          .toList(),
    );
  }
}
