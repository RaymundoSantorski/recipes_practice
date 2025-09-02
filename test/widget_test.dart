// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:recipes_practice/main.dart';

void main() {
  testWidgets('App displays recipe list', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our app shows a list when first open
    expect(find.byType(Container), findsOne);
    expect(find.byType(GridView), findsNothing);

    // Tap the grid icon and trigger a frame
    await tester.tap(find.byType(IconButton));
    await tester.pump();

    // Verify that the grid shows after tapping the icon
    expect(find.byType(GridView), findsOne);
    expect(find.byType(ListView), findsNothing);

    // Tap one grid item and trigger a frame
    await tester.tap(find.byKey(Key('1')));
    await tester.pumpAndSettle();

    // Verify that the app navigates to the recipe screen
    expect(find.byType(Divider), findsOne);
    expect(find.byType(GridView), findsNothing);
  });
}
