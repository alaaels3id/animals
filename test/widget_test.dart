import 'package:animals_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Animals app smoke test and search verification', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    // 1. Initial screen renders header and animal card
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is RichText &&
            widget.text.toPlainText().contains('Animals Kingdom') &&
            widget.text.toPlainText().contains('Characters'),
      ),
      findsOneWidget,
    );
    expect(find.text('Black Panther'), findsWidgets);
    expect(find.text('Tap to explore'), findsWidgets);

    // 2. Open search bar
    await tester.tap(find.byIcon(Icons.search_rounded));
    await tester.pumpAndSettle();

    expect(find.byType(TextField), findsOneWidget);

    // 3. Search for Buffalo
    await tester.enterText(find.byType(TextField), 'Buffalo');
    await tester.pumpAndSettle();

    expect(find.text('Water Buffalo'), findsWidgets);
    expect(find.text('Black Panther'), findsNothing);

    // 4. Close search
    await tester.tap(find.byIcon(Icons.close_rounded));
    await tester.pumpAndSettle();

    expect(find.byType(TextField), findsNothing);
    expect(find.text('Black Panther'), findsWidgets);
  });

  testWidgets('Burger menu drawer opens and filters categories', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    // Open side menu via burger icon
    await tester.tap(find.byIcon(Icons.menu_rounded));
    await tester.pumpAndSettle();

    expect(find.text('CATEGORIES'), findsOneWidget);
    expect(find.text('Carnivores'), findsOneWidget);
    expect(find.text('Herbivores'), findsOneWidget);

    // Tap Herbivores
    await tester.tap(find.text('Herbivores'));
    await tester.pumpAndSettle();

    // Verify drawer closed and category filter is applied
    expect(find.text('Category: Herbivore'), findsOneWidget);
    expect(find.text('Water Buffalo'), findsWidgets);
    expect(find.text('Black Panther'), findsNothing);
  });
}
