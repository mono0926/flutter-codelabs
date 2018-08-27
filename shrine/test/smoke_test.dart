import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shrine/home.dart';

void main() {
  testWidgets('HomePage smoke test', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HomePage(),
        ),
      ),
    );

    expect(find.text('SHRINE'), findsOneWidget);
    expect(
        find.byWidgetPredicate((widget) =>
            widget.runtimeType == Semantics &&
            (widget as Semantics).properties.label == 'search'),
        findsOneWidget);
  });
}
