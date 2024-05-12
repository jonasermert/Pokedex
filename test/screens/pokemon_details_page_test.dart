import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/screens/pokemon_details_page.dart';

void main() {
  testWidgets('PokemonDetailsPage Widget test', (WidgetTester tester) async {
    // Mock Pokemon data
    final pokemon =
        Pokemon(name: 'Bulbasaur', url: 'https://pokeapi.co/api/v2/pokemon/1/');

    // Build our widget and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: PokemonDetailsPage(pokemon),
    ));

    // Verify that the appbar title is correct
    expect(find.text('Bulbasaur'), findsOneWidget);

    // Verify that the CircularProgressIndicator is displayed initially
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Simulate loading state and verify that the Pokemon details are displayed
    await tester.pump(Duration(seconds: 1));
    expect(find.text('Name: Bulbasaur'), findsOneWidget);
  });
}
