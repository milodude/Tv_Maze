import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:tv_maze/models/season.dart';
import 'package:tv_maze/services/season_service.dart';
import 'package:tv_maze/utils/app_settings.dart';

void main() {
  List<Map<String, Object?>> returnedSeasons = <Map<String, Object?>>[
    <String, dynamic>{
      'id': 3,
      'url': 'https://www.tvmaze.com/seasons/3/person-of-interest-season-1',
      'number': 1,
      'name': '',
      'episodeOrder': 23,
      'premiereDate': '2011-09-22',
      'endDate': '2012-05-17',
      'network': <String, dynamic>{
        'id': 2,
        'name': 'CBS',
        'country': <String, dynamic>{
          'name': 'United States',
          'code': 'US',
          'timezone': 'America/New_York'
        }
      },
      'webChannel': null,
      'image': <String, dynamic>{
        'medium':
            'https://static.tvmaze.com/uploads/images/medium_portrait/24/60864.jpg',
        'original':
            'https://static.tvmaze.com/uploads/images/original_untouched/24/60864.jpg'
      },
      'summary': '',
      '_links': <String, dynamic>{
        'self': <String, dynamic>{'href': 'https://api.tvmaze.com/seasons/3'}
      }
    }
  ];

  Future<http.Response> _mockRequest(http.Request request) async {
    if (request.url
        .toString()
        .startsWith('https://api.tvmaze.com/shows/1/seasons')) {
      return http.Response(
        jsonEncode(returnedSeasons),
        200,
        headers: AppSettings.getHeader(),
      );
    }

    return http.Response('Error: Unknown endpoint', 404);
  }

  testWidgets('season service should return seasons',
      (WidgetTester tester) async {
    final SeasonService apiSeason =
        SeasonService(http: MockClient(_mockRequest));

    final List<Season>? season = await apiSeason.getSeasons(1);
    expect(season!.first.id, returnedSeasons.first['id']);
  });

}
