
import 'package:flutter_test/flutter_test.dart';
import 'package:mywardrobe/app/app.dart';

void main() {
  testWidgets('My Wardrobe app loads', (WidgetTester tester) async {
    await tester.pumpWidget(const MyWardrobeApp());

    expect(find.text('MY WARDROBE'), findsOneWidget);
  });
}
