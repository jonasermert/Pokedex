import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/widgets/search_bar.dart';

void main() {
  testWidgets('SearchBar Widget test', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: SearchBar(
          onSearch: (String query) {
            // Test if onSearch callback is called with correct query
            expect(query, 'Test');
          },
        ),
      ),
    ));

    // Tap on the search text field and enter 'Test'
    await tester.enterText(find.byType(TextField), 'Test');

    // Verify that the text was changed.
    expect(find.text('Test'), findsOneWidget);
  });
}
