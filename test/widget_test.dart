// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:recipes_practice/main.dart';
import 'package:recipes_practice/widgets/no_recipes.dart';
import 'package:recipes_practice/screens/recipe_screen.dart';

void main() {
  testWidgets('App displays recipe list and navigates correctly', (
    WidgetTester tester,
  ) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // The app starts with a NoRecipe widget as is retreiving data

    // Trigger a new frame, where there must be a ListView
    await tester.pumpAndSettle();
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(GridView), findsNothing);
    expect(find.byType(NoRecipes), findsNothing);

    // Tap the grid icon and trigger a frame
    await tester.tap(find.byType(IconButton));
    await tester.pumpAndSettle();

    // Verify that the grid view shows after tapping the icon
    expect(find.byType(GridView), findsOneWidget);
    expect(find.byType(ListView), findsNothing);

    // Tap on the first recipe grid item
    await tester.tap(find.byKey(const Key('recipe_1')));
    await tester.pumpAndSettle();

    // Verify that the app navigates to the recipe screen
    expect(find.byType(RecipeScreen), findsOneWidget);
    expect(find.text('Ingredientes:'), findsOneWidget);
  });
}
