import 'package:client_control/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Integration', (tester) async {
    app.main();
    await tester.pumpAndSettle();
    expect(find.text('Menu'), findsNothing);
    await Future.delayed(const Duration(seconds: 2));
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();
    await Future.delayed(const Duration(seconds: 2));
    expect(find.text('Menu'), findsOneWidget);
  });
}
