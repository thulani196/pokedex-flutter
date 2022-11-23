import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pokedex/utils/string_extension.dart';

import '../models/pokemon_model.dart';

Color getAccentColor(String pokemonType) {
  return pokemonType == "Grass"
      ? Colors.greenAccent
      : pokemonType == "Fire"
          ? Colors.redAccent
          : pokemonType == "Water"
              ? Colors.blue
              : pokemonType == "Poison"
                  ? Colors.deepPurpleAccent
                  : pokemonType == "Electric"
                      ? Colors.amber
                      : pokemonType == "Rock"
                          ? Colors.grey
                          : pokemonType == "Ground"
                              ? Colors.brown
                              : pokemonType == "Psychic"
                                  ? Colors.indigo
                                  : pokemonType == "Fighting"
                                      ? Colors.orange
                                      : pokemonType == "Bug"
                                          ? Colors.lightGreenAccent
                                          : pokemonType == "Ghost"
                                              ? Colors.deepPurple
                                              : pokemonType == "Normal"
                                                  ? Colors.black26
                                                  : Colors.pink;
}

String formatId(int id) {
  NumberFormat formatter = NumberFormat("#000");
  return formatter.format(id);
}

String getBMI(int weight, int height) {
  return ((weight / pow(height, 2)) * 10000).toStringAsFixed(1);
}

int getAveragePower(List<PokemonStats> stats) {
  int averagePover = 0;

  for (PokemonStats stat in stats) {
    averagePover = averagePover + stat.baseStat!;
  }
  return averagePover ~/ 6;
}

double getPercentage(int value) {
  var percentage = value / 100;

  if (percentage > 1) return 1.0;
  return percentage;
}

String getTypes(List<Types> types) {
  String typesString = '';
  List<String> typesList = [];

  if (types.length > 1) {
    for (Types type in types) {
      typesList.add(type.type!.name!.capitalize());
    }

    final sb = StringBuffer();
    sb.writeAll(typesList, ', ');
    return sb.toString();
  } else {
    typesString = types[0].type!.name!;
  }

  return typesString.capitalize();
}
