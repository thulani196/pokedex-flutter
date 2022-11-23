import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/repositories/pokemon_service.dart';

import 'mock_data.dart';
import 'pokemon_test.mocks.dart';

@GenerateMocks([PokemonService])
void main() {
  var pokemon = MockPokemonService();

  test('Should return pokemons from network with Success', () async {
    when(pokemon.getPokemons(isFirstTime: true)).thenAnswer((_) async {
      var p = List<dynamic>.from(mockObject)
          .map((model) => PokemonModel.fromJson(model))
          .toList();

      return Future.value(p);
    });

    final pokemonList = await pokemon.getPokemons(isFirstTime: true);
    expect(pokemonList.length, 2);
  });

  test('Should add pokemon to favorites', () async {
    var pokemons = List<dynamic>.from(mockObject)
        .map((model) => PokemonModel.fromJson(model))
        .toList();

    when(pokemon.addToFavorites(pokemons[0])).thenAnswer((_) {
      return Future.value([pokemons[0]]);
    });

    final results = await pokemon.addToFavorites(pokemons[0]);
    expect(results.length, 1);
  });

  test('return pokemons from favorites', () async {
    when(pokemon.getFavorites()).thenAnswer((_) async {
      var p = List<dynamic>.from(mockObject)
          .map((model) => PokemonModel.fromJson(model))
          .toList();

      return Future.value(p);
    });

    final pokemonList = await pokemon.getFavorites();
    expect(pokemonList.length, 2);
  });

  test('Should remove pokemon from favorites', () async {
    var pokemons = List<dynamic>.from(mockObject)
        .map((model) => PokemonModel.fromJson(model))
        .toList();

    when(pokemon.removeFromFavorites(pokemons[0])).thenAnswer((_) async {
      return Future.value([pokemons[1]]);
    });

    final pokemonList = await pokemon.removeFromFavorites(pokemons[0]);
    expect(pokemonList.length, 1);
    expect(pokemonList[0].name, 'Pikachu');
  });
}
