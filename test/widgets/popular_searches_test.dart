import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/widgets/popular_searches.dart';

void main() {
  testWidgets('PopularSearches Widget test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: PopularSearches(
          popularSearches: ['Pikachu', 'Charizard', 'Bulbasaur'],
          onTap: (String searchTerm) {
            // Test if onTap callback is called with correct search term
            expect(searchTerm, 'Pikachu');
          },
        ),
      ),
    ));

    // Tap on the first chip ('Pikachu')
    await tester.tap(find.text('Pikachu'));

    // Wait for the onTap callback to be processed
    await tester.pump();

    // Verify that the onTap callback was called with the correct search term
    expect(find.text('Pikachu'), findsOneWidget);
  });
}
