import 'package:flutter_test/flutter_test.dart';
import 'package:nexabound/nexabound_app.dart';

void main() {
  testWidgets('NexaboundApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const NexaboundApp());
    expect(find.byType(NexaboundApp), findsOneWidget);
  });
}
