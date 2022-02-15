import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_maze/generic_widgets/back_floating_action_button.dart';
import 'package:tv_maze/utils/constants.dart';

void main() {
  Widget widgetSetupToBeTested({required Widget child}) {
    return MaterialApp(
      home: Scaffold(floatingActionButton: child, body: Container()),
    );
  }

  testWidgets('back floating action button should execute an action when pressed', (WidgetTester tester) async {
    String value = 'not modified';

    void setSelected(BuildContext context) {
      value = 'Modified!!';
    }

    // ARRANGE
    await tester.pumpWidget(widgetSetupToBeTested(
        child: BackFloatingActionButton(action: setSelected)));

    //ACT
    Finder but = find.byKey(const Key(Constants.backFloatingActionButtonKey));
    await tester.tap(but);
    await tester.pump();

    //ASSERT
    expect(value, 'Modified!!');
  });
}
