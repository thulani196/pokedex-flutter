import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/utils/string_extension.dart';

import '../bloc/favorites/bloc.dart';
import '../constants/constants.dart';
import '../models/pokemon_model.dart';
import '../repositories/pokemon_service.dart';
import '../utils/helpers.dart';
import '../widgets/stats.dart';

class DetailsScreen extends StatefulWidget {
  final PokemonModel pokemon;
  const DetailsScreen({super.key, required this.pokemon});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool addedToFavourites = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getFavoritePokemons();
    });
    super.initState();
  }

  _getFavoritePokemons() async {
    var favoritePokemons = await PokemonService().getFavorites();
    for (var u in favoritePokemons) {
      if (u.id == widget.pokemon.id) {
        setState(() {
          addedToFavourites = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: getAccentColor(
                    widget.pokemon.types![0].type!.name!.capitalize())
                .withOpacity(0.1),
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                color: sliverTextColor,
              ),
            ),
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              background: _pokemonCard(),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            _basicDetails(widget.pokemon.height!, widget.pokemon.weight!),
            const SizedBox(
              height: 10,
            ),
            _stats(widget.pokemon.stats!)
          ]))
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: addedToFavourites
            ? removeFavoriteBackgroundColor
            : addFavoriteBackgroundColor,
        onPressed: () {
          setState(() {
            addedToFavourites = !addedToFavourites;
            if (addedToFavourites) {
              BlocProvider.of<FavoriteBloc>(context)
                  .add(AddToFavorites(pokemon: widget.pokemon));
            } else {
              BlocProvider.of<FavoriteBloc>(context)
                  .add(RemoveFromFavorites(pokemon: widget.pokemon));
            }
          });
        },
        label: Text(
          addedToFavourites ? 'Remove from favorites' : 'Add as favorite',
          style: TextStyle(
              color: addedToFavourites
                  ? addFavoriteBackgroundColor
                  : Colors.white),
        ),
      ),
    );
  }

  Stack _pokemonCard() {
    return Stack(
      children: [
        Positioned(
          bottom: -10,
          right: -10,
          child: Image.asset('assets/images/pokeball.png',
              height: 176, width: 140, fit: BoxFit.fitHeight),
        ),
        Positioned(
          top: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 100),
                child: Text(
                  widget.pokemon.name!.capitalize(),
                  style: const TextStyle(
                      color: sliverTextColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 32),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 10),
                child: Text(
                  getTypes(widget.pokemon.types!),
                  style: const TextStyle(
                    color: sliverTextColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          child: SizedBox(
            width: 100,
            height: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text(
                    "#${formatId(widget.pokemon.id!)}",
                    style: const TextStyle(
                        color: sliverTextColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 5,
          bottom: 15,
          child: SizedBox(
            width: 140,
            height: 140,
            child: Image.network(
              widget.pokemon.sprites!.other!.officialArtwork!.frontDefault!,
              fit: BoxFit.cover,
              width: 140,
              height: 140,
            ),
          ),
        ),
      ],
    );
  }

  Widget _basicDetails(int height, int weight) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 17.0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 17.0, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Height"),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(height.toString())
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 57.0, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Weight"),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(weight.toString())
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 57.0, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("BMI"),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(getBMI(height, weight))
                  ],
                ),
              )
            ]),
      ),
    );
  }

  Widget _stats(List<PokemonStats> stats) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                "Base Stats",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: sliverTextColor),
              ),
            ),
            const Divider(),
            for (PokemonStats stat in stats)
              Stats(
                  name: stat.stat!.name!.capitalize(),
                  statValue: stat.baseStat!),
            Stats(
              name: 'Avg. Power',
              statValue: getAveragePower(widget.pokemon.stats!),
            ),
          ],
        ),
      ),
    );
  }
}
