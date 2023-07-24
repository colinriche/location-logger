import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freelance_projects/main.dart';

void main() {
  testWidgets('MyApp test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(const [])); // Pass an empty list of geofences for testing

    // You can add your widget tests here

    // Example: Verifying if a widget with specific text is present
    expect(find.text('Geofence Service'), findsOneWidget);
  });
}
