import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv_maze/generic_widgets/dropdown_season.dart';
import 'package:tv_maze/models/season.dart';

void main() {
  Widget widgetSetupToBeTested({required Widget child}) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
        child: child,
      )),
    );
  }

  testWidgets('Given a DropDownSeason When loading it should show it properly',
      (WidgetTester tester) async {
    void _setSelected(Season newValue) {}
    Season season1 = Season(id: 1, number: 1);
    Season season2 = Season(id: 70, number: 2);

    // ARRANGE
    List<Season> seasonList = <Season>[season1, season2];

    await tester.pumpWidget(widgetSetupToBeTested(
        child: DropdownSeasons(_setSelected, seasonList, seasonList.first)));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1)); // finish the menu animation
    //ACT
    final Finder dropDown = find.byKey(const Key('DropDown'));
    await tester.pump(const Duration(seconds: 1)); // finish the menu animation
    //ASSERT
    expect(dropDown, findsWidgets);
  });

  testWidgets(
      'Given a DropDownSeason When loading it and clicking an option should show set the value properly',
      (WidgetTester tester) async {
    Season value = Season(id: 2, number: 7);
    void _setSelected(Season selectedSeason) {
      value = selectedSeason;
    }

    Season season1 = Season(id: 1, number: 1);
    Season season2 = Season(id: 70, number: 2);

    // ARRANGE
    List<Season> seasonList = <Season>[season1, season2];

    await tester.pumpWidget(widgetSetupToBeTested(
        child: DropdownSeasons(_setSelected, seasonList, seasonList.first)));

    //ACT
    //Hago desplegar el combo
    await tester.tap(find.byKey(const Key('DropDown')));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1)); // finish the menu animation

    //Hago click en item del combo. Si sacamos el  last del findByKey deja de funcionar. Encuentra muchos elementos. No se a que se debe.
    await tester.tap(find.byKey(const Key('2_Key')).last);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1)); // finish the menu animation
    //ASSERT
    expect(value.id, equals(70));
  });

  testWidgets(
      'Given a DropDownSeason When loading it with empty list of seasons should disable the dropdown',
      (WidgetTester tester) async {
    void _setSelected(Season selectedSeason) {}
    // ARRANGE
    List<Season> countryList = <Season>[];

    await tester.pumpWidget(widgetSetupToBeTested(
        child: DropdownSeasons(_setSelected, countryList, null)));

    //ACT
    //Intento desplegar el combo
    await tester.tap(find.byKey(const Key('DropDown')));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1)); // finish the menu animation

    //ASSERT
    expect(find.byKey(const Key('2_Key')), findsNothing);
  });
}
