import 'package:flutter/material.dart';
import 'package:pokedex/screens/pokemon_details_page.dart';
import 'package:pokedex/widgets/popular_searches.dart';

import '../models/pokemon.dart';
import '../services/pokemon_service.dart';
import '../utils/pokemon_search_delegate.dart';

class PokemonList extends StatefulWidget {
  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<Pokemon>> _pokemonList;

  List<String> _popularSearches = ["Pikachu", "Charizard", "Bulbasaur"];

  @override
  void initState() {
    super.initState();
    _pokemonList = PokemonService.fetchPokemon();
  }

  void search(String searchTerm) {
    print('Searching for: $searchTerm');
  }

  void handlePopularSearch(String searchTerm) {
    print('Popular search term clicked: $searchTerm');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokédex'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final String? searchTerm = await showSearch<String>(
                context: context,
                delegate: PokemonSearchDelegate(),
              );

              if (searchTerm != null) {
                print('Searching for: $searchTerm');
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Text(
            'Most searched:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          PopularSearches(
            popularSearches: _popularSearches,
            onTap: handlePopularSearch,
          ),
          Expanded(
            child: FutureBuilder<List<Pokemon>>(
              future: _pokemonList,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data![index].name),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PokemonDetailsPage(snapshot.data![index]),
                            ),
                          );
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
