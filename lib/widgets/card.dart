import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/widgets/pokemon_card_data.dart';
import '../bloc/bloc.dart';
import '../models/pokemon_model.dart';
import '../screens/details_screen.dart';

class PokemonCard extends StatelessWidget {
  final PokemonModel pokemon;

  const PokemonCard({Key? key, required this.pokemon}) : super(key: key);

  BoxDecoration getContainerDecoration() => BoxDecoration(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
        border: Border.all(
          color: Colors.grey.withOpacity(0.24),
          width: 1,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          enableFeedback: true,
          splashColor: Colors.red[50],
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                          pokemon: pokemon,
                        )));
          },
          child: Container(
            padding: const EdgeInsets.only(bottom: 7),
            decoration: getContainerDecoration(),
            child: Stack(
              children: [
                PokemonCardData(
                  pokemon: pokemon,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
