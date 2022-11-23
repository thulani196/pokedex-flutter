// Mocks generated by Mockito 5.3.2 from annotations
// in pokedex/test/pokemon_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:pokedex/models/pokemon_model.dart' as _i4;
import 'package:pokedex/repositories/pokemon_service.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [PokemonService].
///
/// See the documentation for Mockito's code generation for more information.
class MockPokemonService extends _i1.Mock implements _i2.PokemonService {
  MockPokemonService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.PokemonModel>> getPokemons() => (super.noSuchMethod(
        Invocation.method(
          #getPokemons,
          [],
        ),
        returnValue:
            _i3.Future<List<_i4.PokemonModel>>.value(<_i4.PokemonModel>[]),
      ) as _i3.Future<List<_i4.PokemonModel>>);
  @override
  _i3.Future<List<_i4.PokemonModel>> getFavorites() => (super.noSuchMethod(
        Invocation.method(
          #getFavorites,
          [],
        ),
        returnValue:
            _i3.Future<List<_i4.PokemonModel>>.value(<_i4.PokemonModel>[]),
      ) as _i3.Future<List<_i4.PokemonModel>>);
  @override
  _i3.Future<List<_i4.PokemonModel>> addToFavorites(
          _i4.PokemonModel? pokemon) =>
      (super.noSuchMethod(
        Invocation.method(
          #addToFavorites,
          [pokemon],
        ),
        returnValue:
            _i3.Future<List<_i4.PokemonModel>>.value(<_i4.PokemonModel>[]),
      ) as _i3.Future<List<_i4.PokemonModel>>);
  @override
  _i3.Future<List<_i4.PokemonModel>> removeFromFavorites(
          _i4.PokemonModel? pokemon) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeFromFavorites,
          [pokemon],
        ),
        returnValue:
            _i3.Future<List<_i4.PokemonModel>>.value(<_i4.PokemonModel>[]),
      ) as _i3.Future<List<_i4.PokemonModel>>);
}
