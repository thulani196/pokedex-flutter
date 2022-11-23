import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/strings.dart';
import '../models/pokemon_model.dart';
import '../models/pokemon_response_model.dart';

class PokemonService {
  Future<List<PokemonModel>> getPokemons() async {
    try {
      var response = await http
          .get(Uri.parse('https://www.pokeapi.co/api/v2/pokemon?limit=5'));

      var results = PokemonResponseModel.fromJson(json.decode(response.body));
      var ids = _extractIds(results);
      var pokemons = await _getPokemonDetails(ids);

      return pokemons;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<PokemonModel>> _getPokemonDetails(List<String> ids) async {
    try {
      List<dynamic> list = await Future.wait(ids.map((id) =>
          http.get(Uri.parse("https://www.pokeapi.co/api/v2/pokemon/$id/"))));

      List<PokemonModel> pokemons = List<PokemonModel>.from(
          list.map((model) => PokemonModel.fromJson(json.decode(model.body))));

      return pokemons;
    } catch (e) {
      rethrow;
    }
  }

  List<String> _extractIds(PokemonResponseModel results) {
    List<String> ids = List.empty(growable: true);
    for (PokemonItem item in results.results!) {
      final uri = Uri.parse(item.url!);
      var path = uri.path;
      var pokemon = path.split('/')[4];
      ids.add(pokemon);
    }
    return ids;
  }

  Future<List<PokemonModel>> getFavorites() async {
    final Future<SharedPreferences> pref = SharedPreferences.getInstance();
    try {
      final SharedPreferences prefs = await pref;

      String favoritePokemons = prefs.getString(favouritePokemonsKey) ?? '';
      List<PokemonModel> pokemons = List.empty(growable: true);

      if (favoritePokemons.isNotEmpty && favoritePokemons != '') {
        pokemons = List<PokemonModel>.from(json
            .decode(favoritePokemons)
            .map((model) => PokemonModel.fromJson(model)));
      }

      return pokemons;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<PokemonModel>> addToFavorites(PokemonModel pokemon) async {
    final Future<SharedPreferences> pref = SharedPreferences.getInstance();
    try {
      final SharedPreferences prefs = await pref;
      var favorites = await getFavorites();

      favorites.add(pokemon);
      await prefs.remove(favouritePokemonsKey);
      await prefs.setString(favouritePokemonsKey, json.encode(favorites));
      return favorites;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<PokemonModel>> removeFromFavorites(PokemonModel pokemon) async {
    final Future<SharedPreferences> pref = SharedPreferences.getInstance();
    try {
      final SharedPreferences prefs = await pref;
      var favorites = await getFavorites();

      for (var i = 0; i < favorites.length; i++) {
        if (pokemon.id == favorites[i].id) {
          favorites.removeAt(i);
          break;
        }
      }
      await prefs.remove(favouritePokemonsKey);
      await prefs.setString(favouritePokemonsKey, json.encode(favorites));
      return favorites;
    } catch (e) {
      rethrow;
    }
  }
}
