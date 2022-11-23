import 'package:flutter/material.dart';
import 'package:pokedex/utils/string_extension.dart';
import '../constants/constants.dart';
import '../models/pokemon_model.dart';
import '../utils/helpers.dart';

class PokemonCardData extends StatelessWidget {
  final PokemonModel pokemon;

  const PokemonCardData({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: getAccentColor(pokemon.types![0].type!.name!.capitalize())
                  .withOpacity(0.1),
            ),
            // color:
            height: 200,
            child: Center(
              child: Image.network(
                pokemon.sprites!.other!.officialArtwork!.frontDefault!,
                fit: BoxFit.contain,
                alignment: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
          child: Text(
            "#${formatId(pokemon.id!)}",
            style: const TextStyle(
                color: pokemonGreyText,
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
          child: Text(
            pokemon.name!.capitalize(),
            style: const TextStyle(
                color: pokemonName, fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            getTypes(pokemon.types!),
            style: const TextStyle(
                color: pokemonGreyText,
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
