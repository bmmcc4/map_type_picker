import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('Map Picker Appeared', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Container(key: const Key('MapTypePickerButton')),
            ))));
  });
  var finder = find.byKey(const Key('MapTypePickerButton'));
}
