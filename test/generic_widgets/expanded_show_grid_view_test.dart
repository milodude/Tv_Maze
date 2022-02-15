import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:tv_maze/generic_widgets/expanded_show_grid_view.dart';
import 'package:tv_maze/models/show.dart';
import 'package:tv_maze/utils/constants.dart';

import 'expanded_show_grid_view_test.mocks.dart';

@GenerateMocks(<Type>[],
  customMocks: <MockSpec<dynamic>>[
    MockSpec<NavigatorObserver>(
      returnNullOnMissingStub: true,
    )
  ],)

void main() {
  MockNavigatorObserver mockNavigatorObserver = MockNavigatorObserver();

   Widget widgetSetupToBeTested({required Widget child}) {
    return MaterialApp(
      home: Column( children: <Widget>[child]),
      navigatorObservers: <NavigatorObserver>[mockNavigatorObserver],
    );
  }
  
  testWidgets('expanded show grid view should render properly', (WidgetTester tester) async {
    List<Show> showList = <Show>[Show(id: 1, name: 'True Detective', image:null, summary: 'A summArY', schedule: 'schedule', status: 'status', genres: <dynamic>['test'])];

      await tester.pumpWidget(
        widgetSetupToBeTested(child: ExpandedShowsGridView(showList: showList,)));
    await tester.pump();

    final Finder gridView = find.byKey(const Key(Constants.gridViewExpandedKey));

    expect(gridView, findsOneWidget);
  });

   testWidgets('expanded show grid view should show footer with an opacity of 0.6', (WidgetTester tester) async {
    List<Show> showList = <Show>[Show(id: 1, name: 'True Detective', image:null, summary: 'A summArY', schedule: 'schedule', status: 'status', genres: <dynamic>['test'])];

      await tester.pumpWidget(
        widgetSetupToBeTested(child: ExpandedShowsGridView(showList: showList,)));
    await tester.pump();

    final Card card = find.byKey(const Key(Constants.gridViewCardKey)).evaluate().single.widget as Card;

    expect(card.key, equals(const Key(Constants.gridViewCardKey)));

    final GridTile cardTile = find.byKey(const Key(Constants.gridViewTileKey)).evaluate().single.widget as GridTile;
     await tester.pump(const Duration(seconds: 1));

     Opacity tileOpacity = cardTile.footer as Opacity;
     expect(tileOpacity.opacity, equals(0.6));
  });
}