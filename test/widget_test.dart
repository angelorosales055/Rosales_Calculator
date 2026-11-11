import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:rosales_calculator/main.dart';

void main() {
  testWidgets('CalculatorApp smoke and interaction test',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CalculatorApp());

    // Verify app title and calculator headings exist.
    expect(find.text('My Stateful Calculator'), findsOneWidget);
    expect(find.text('BASIC CALCULATOR'), findsOneWidget);
    expect(find.text('RESULT'), findsOneWidget);
    expect(find.text('0'), findsOneWidget);

    // Enter numbers into the text fields
    final textFields = find.byType(TextField);
    expect(textFields, findsNWidgets(2));

    await tester.enterText(textFields.at(0), '12');
    await tester.enterText(textFields.at(1), '4');

    // Tap the '+' button
    await tester.tap(find.widgetWithText(ElevatedButton, '+'));
    await tester.pump();
    expect(find.text('16.0'), findsOneWidget);

    // Tap the '-' button
    await tester.tap(find.widgetWithText(ElevatedButton, '−'));
    await tester.pump();
    expect(find.text('8.0'), findsOneWidget);

    // Tap the '×' button
    await tester.tap(find.widgetWithText(ElevatedButton, '×'));
    await tester.pump();
    expect(find.text('48.0'), findsOneWidget);

    // Tap the '÷' button
    await tester.tap(find.widgetWithText(ElevatedButton, '÷'));
    await tester.pump();
    expect(find.text('3.0'), findsOneWidget);

    // Tap Clear
    await tester.tap(find.widgetWithText(OutlinedButton, 'Clear'));
    await tester.pump();
    expect(find.text('0'), findsOneWidget);
    expect(find.text('Enter two numbers'), findsOneWidget);
  });
}
