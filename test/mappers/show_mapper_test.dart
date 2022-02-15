import 'package:flutter_test/flutter_test.dart';
import 'package:tv_maze/mappers/show_mapper.dart';
import 'package:tv_maze/models/show.dart';

void main() {
  dynamic show;
  dynamic showStringsNull;

  setUp(() {
     show = {
            "id": 60081,
            "name": "Justice U",
            "image": null,
            "summary": "<p>After years of fighting alongside masked heroes, John Diggle embarks on a new mission to recruit five young meta humans to live undercover as freshmen at a prestigious university. There he will oversee their education and train them to become the heroes of tomorrow.</p>",
            "schedule": {
                "time": "",
                "days": []
            },
            "status": "In Development",
            "genres": ["Science-Fiction"],
            };
      showStringsNull = {
            "id": 60081,
            "name": null,
            "image": null,
            "summary": "<p>After years of fighting alongside masked heroes, John Diggle embarks on a new mission to recruit five young meta humans to live undercover as freshmen at a prestigious university. There he will oversee their education and train them to become the heroes of tomorrow.</p>",
            "schedule": {
                "time": "",
                "days": []
            },
            "status":null,
            "genres": ["Science-Fiction"],
            };
  });
  testWidgets('show mapper: should map properties properly', (tester) async {
    var mappedShow = ShowMapper.map(show);
    expect(mappedShow, isA<Show>());
  });

  testWidgets('show mapper: should map properties despite string fields are null', (tester) async {
    var mappedShow = ShowMapper.map(showStringsNull);
    expect(mappedShow, isA<Show>());
  });
}