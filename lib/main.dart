import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/bloc.dart';
import 'package:pokedex/bloc/favorites/bloc.dart';
import 'package:pokedex/screens/splash_screen.dart';

import 'repositories/pokemon_repository_impl.dart';

void main() {
  // runApp(const MyApp());
  runApp(MaterialApp(
    home: MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => PokemonBloc(PokemonRepositoryImpl())
              ..add(const GetPokemons(isFirstTime: true))),
        BlocProvider(
            create: (context) =>
                FavoriteBloc(PokemonRepositoryImpl())..add(GetFavorites()))
      ],
      child: const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const SplashScreen(),
      },
    );
  }
}
