import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:tv_maze/generic_widgets/expanded_show_grid_view.dart';
import 'package:tv_maze/models/show.dart';
import 'package:tv_maze/utils/constants.dart';

import 'expanded_show_grid_view_test.mocks.dart';

@GenerateMocks([],
  customMocks: [
    MockSpec<NavigatorObserver>(
      returnNullOnMissingStub: true,
    )
  ],)

void main() {
  var mockNavigatorObserver = MockNavigatorObserver();

   Widget widgetSetupToBeTested({required Widget child}) {
    return MaterialApp(
      home: Column( children: [child]),
      navigatorObservers: [mockNavigatorObserver],
    );
  }
  
  testWidgets('expanded show grid view should render properly', (tester) async {
    var showList = <Show>[Show(id: 1, name: 'True Detective', image:null, summary: 'A summArY', schedule: 'schedule', status: 'status', genres: ['test'])];

      await tester.pumpWidget(
        widgetSetupToBeTested(child: ExpandedShowsGridView(showList: showList,)));
    await tester.pump();

    final gridView = find.byKey(const Key(Constants.gridViewExpandedKey));

    expect(gridView, findsOneWidget);
  });

   testWidgets('expanded show grid view should show footer with an opacity of 0.6', (tester) async {
    var showList = <Show>[Show(id: 1, name: 'True Detective', image:null, summary: 'A summArY', schedule: 'schedule', status: 'status', genres: ['test'])];

      await tester.pumpWidget(
        widgetSetupToBeTested(child: ExpandedShowsGridView(showList: showList,)));
    await tester.pump();

    final card = find.byKey(const Key(Constants.gridViewCardKey)).evaluate().single.widget as Card;

    expect(card.key, equals(const Key(Constants.gridViewCardKey)));

    final cardTile = find.byKey(const Key(Constants.gridViewTileKey)).evaluate().single.widget as GridTile;
     await tester.pump(const Duration(seconds: 1));

     var tileOpacity = cardTile.footer as Opacity;
     expect(tileOpacity.opacity, equals(0.6));
  });
}