import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:tv_maze/models/show.dart';
import 'package:tv_maze/services/show_service.dart';
import 'package:tv_maze/utils/app_settings.dart';

void main() {
  List<Map<String, Object?>> returnedShow = <Map<String, Object?>>[
    <String, dynamic>{
      'id': 60081,
      'name': 'Justice U',
      'image': null,
      'summary':
          '<p>After years of fighting alongside masked heroes, John Diggle embarks on a new mission to recruit five young meta humans to live undercover as freshmen at a prestigious university. There he will oversee their education and train them to become the heroes of tomorrow.</p>',
      'schedule': <String, dynamic>{'time': '', 'days': ''},
      'status': 'In Development',
      'genres': <String>['Science-Fiction'],
    }
  ];

  List<Map<String, dynamic>> returnedSearch = <Map<String, dynamic>>[
    <String, dynamic>{
      'score': 0.6982418,
      'show': <String, dynamic>{
        'id': 70,
        'name': 'Justice U',
        'image': null,
        'summary':
            '<p>After years of fighting alongside masked heroes, John Diggle embarks on a new mission to recruit five young meta humans to live undercover as freshmen at a prestigious university. There he will oversee their education and train them to become the heroes of tomorrow.</p>',
        'schedule':  <String, dynamic>{'time': '', 'days': <String>[]},
        'status': 'In Development',
        'genres':  <String>['Science-Fiction'],
      }
    }
  ];

  Future<http.Response> _mockRequest(http.Request request) async {
    if (request.url.toString().startsWith('https://api.tvmaze.com/shows')) {
      return http.Response(
        jsonEncode(returnedShow),
        200,
        headers: AppSettings.getHeader(),
      );
    }

    if (request.url
        .toString()
        .startsWith('https://api.tvmaze.com/search/shows')) {
      return http.Response(
        jsonEncode(returnedSearch),
        200,
        headers: AppSettings.getHeader(),
      );
    }
    return http.Response('Error: Unknown endpoint', 404);
  }

  testWidgets('show service should return shows', (WidgetTester tester) async {
    final ShowService apiShow = ShowService(MockClient(_mockRequest));
    final List<Show>? show = await apiShow.getShows();
    expect(show!.first.id, returnedShow.first['id']);
  });

  testWidgets('show service should search shows', (WidgetTester tester) async {
    final ShowService apiShow = ShowService(MockClient(_mockRequest));
    final List<Show>? show = await apiShow.searchShows('aQuerY');
    expect(show!.first.id, 70);
  });
}
