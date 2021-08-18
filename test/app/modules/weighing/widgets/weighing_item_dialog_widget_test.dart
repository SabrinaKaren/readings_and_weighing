import 'package:flutter_test/flutter_test.dart';

main() {
  group('WeighingItemDialogWidget', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      // await tester.pumpWidget(buildTestableWidget(WeighingItemDialogWidget()));
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}