import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:tv_maze/services/show_service.dart';
import 'package:tv_maze/utils/app_settings.dart';

void main() {
  var returnedShow = [ {
            'id': 60081,
            'name': 'Justice U',
            'image': null,
            'summary': '<p>After years of fighting alongside masked heroes, John Diggle embarks on a new mission to recruit five young meta humans to live undercover as freshmen at a prestigious university. There he will oversee their education and train them to become the heroes of tomorrow.</p>',
            'schedule': {
                'time': '',
                'days': []
            },
            'status': 'In Development',
            'genres': ['Science-Fiction'],
            }
    ];

    var returnedSearch = [{
        'score': 0.6982418,
        'show': {
            'id': 70,
            'name': 'Justice U',
            'image': null,
            'summary': '<p>After years of fighting alongside masked heroes, John Diggle embarks on a new mission to recruit five young meta humans to live undercover as freshmen at a prestigious university. There he will oversee their education and train them to become the heroes of tomorrow.</p>',
            'schedule': {
                'time': '',
                'days': []
            },
            'status': 'In Development',
            'genres': ['Science-Fiction'],
            }
    }];

    Future<http.Response> _mockRequest(http.Request request) async {
      if (request.url
          .toString()
          .startsWith('https://api.tvmaze.com/shows')) {
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
  testWidgets('show service should return shows', (tester) async {
    final apiShow = ShowService(MockClient(_mockRequest));
    final show = await apiShow.getShows();
    expect(show!.first.id, returnedShow.first['id']);
  });

  testWidgets('show service should search shows', (tester) async {
    final apiShow = ShowService(MockClient(_mockRequest));
    final show = await apiShow.searchShows('aQuerY');
    expect(show!.first.id, 70);
  });


}