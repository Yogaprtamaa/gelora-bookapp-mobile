import 'package:flutter_test/flutter_test.dart';
import 'package:gelora/main.dart';

void main() {
  testWidgets('Gelora app loads', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    // Splash shows GELORA text before timer
    expect(find.text('GELORA'), findsOneWidget);
    // Advance splash timer (1.5s) to avoid pending timer error
    await tester.pump(const Duration(milliseconds: 1600));
    await tester.pumpAndSettle();
    // After splash, should navigate (BasePage with Beranda)
    expect(find.text('Beranda'), findsOneWidget);
  });
}
