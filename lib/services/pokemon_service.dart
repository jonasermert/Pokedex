import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/pokemon.dart';

class PokemonService {
  static Future<List<Pokemon>> fetchPokemon() async {
    final response = await http
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=151'));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      return List<Pokemon>.from(
          parsed['results'].map((json) => Pokemon.fromJson(json)));
    } else {
      throw Exception('Failed to load Pokemon');
    }
  }

  static Future<PokemonDetails> fetchPokemonDetails(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      return PokemonDetails.fromJson(parsed);
    } else {
      throw Exception('Failed to load Pokemon details');
    }
  }
}
