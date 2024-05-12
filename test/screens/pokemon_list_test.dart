import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/screens/pokemon_list.dart';

void main() {
  testWidgets('PokemonList Widget test', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: PokemonList(),
    ));

    // Verify that the appbar title is correct
    expect(find.text('Pokédex'), findsOneWidget);

    // Verify that the CircularProgressIndicator is displayed initially
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Simulate loading state and verify that the list of Pokemon is displayed
    await tester.pump(Duration(seconds: 1));
    expect(find.byType(ListView), findsOneWidget);

    // Tap on the first item in the list
    await tester.tap(find.text('Bulbasaur'));

    // Wait for the navigation to complete
    await tester.pumpAndSettle();

    // Verify that the PokemonDetailsPage is displayed
    expect(find.text('Bulbasaur'), findsOneWidget);
  });
}
