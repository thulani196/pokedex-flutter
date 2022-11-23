import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/favorites/favorite_bloc.dart';
import '../bloc/favorites/favorite_state.dart';
import '../constants/constants.dart';
import 'all_pokemons_screen.dart';
import 'favorite_pokemon_screen.dart';

class TabViewScreen extends StatefulWidget {
  const TabViewScreen({super.key});

  @override
  State<TabViewScreen> createState() => _TabViewScreenState();
}

class _TabViewScreenState extends State<TabViewScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;
  int _totalFavorites = 0;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoriteBloc, FavoriteState>(
      listener: (context, state) {
        if (state is TotalFavorites) {
          setState(() {
            _totalFavorites = state.totalFavorites;
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Image(
                        fit: BoxFit.scaleDown,
                        height: 30,
                        image: AssetImage('assets/images/logo_white_bg.png')),
                    SizedBox(width: 8),
                    Text(
                      'Pokedex',
                      style: TextStyle(
                          color: sliverTextColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  height: 3,
                )
              ],
            ),
          ),
          backgroundColor: Colors.white,
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: blueColor,
            indicatorWeight: 5,
            unselectedLabelColor: Colors.green,
            tabs: [
              Tab(
                  child: Center(
                      child: Text('All Pokemons',
                          style: TextStyle(
                            color: _selectedIndex == 0
                                ? kTextBlackColor
                                : pokemonGreyText,
                            fontSize: 16,
                          )))),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Favourites',
                        style: TextStyle(
                          color: _selectedIndex == 1
                              ? kTextBlackColor
                              : pokemonGreyText,
                          fontSize: 16,
                        )),
                    const SizedBox(width: 5),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                          color: blueColor, shape: BoxShape.circle),
                      child: Center(
                          child: Text(_totalFavorites.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ))),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [AllPokemonsScreen(), FavoritePokemonsScreen()],
        ),
      ),
    );
  }
}
