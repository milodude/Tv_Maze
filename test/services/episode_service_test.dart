import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:tv_maze/models/episode.dart';
import 'package:tv_maze/services/episode_service.dart';
import 'package:tv_maze/utils/app_settings.dart';

void main() {
  List<Map<String, Object?>> returnedEpisodes = <Map<String, Object?>>[
    <String, dynamic>{
      'id': 1,
        'url': 'https://www.tvmaze.com/episodes/1/under-the-dome-1x01-pilot',
        'name': 'Pilot',
        'season': 1,
        'number': 1,
        'type': 'regular',
        'airdate': '2013-06-24',
        'airtime': '22:00',
        'airstamp': '2013-06-25T02:00:00+00:00',
        'runtime': 60,
        'rating': <String, dynamic>{
            'average': 7.7
        },
        'image': <String, dynamic>{
            'medium': 'https://static.tvmaze.com/uploads/images/medium_landscape/1/4388.jpg',
            'original': 'https://static.tvmaze.com/uploads/images/original_untouched/1/4388.jpg'
        },
        'summary': "<p>When the residents of Chester's Mill find themselves trapped under a massive transparent dome with no way out, they struggle to survive as resources rapidly dwindle and panic quickly escalates.</p>",
        '_links': <String, dynamic>{
            'self': <String, dynamic>{
                'href': 'https://api.tvmaze.com/episodes/1'
            }
        }
    }
  ];

  Future<http.Response> _mockRequest(http.Request request) async {
    if (request.url
        .toString()
        .startsWith('https://api.tvmaze.com/seasons/1/episodes')) {
      return http.Response(
        jsonEncode(returnedEpisodes),
        200,
        headers: AppSettings.getHeader(),
      );
    }

    return http.Response('Error: Unknown endpoint', 404);
  }

  testWidgets('episodes service should return episodes by seasonId',
      (WidgetTester tester) async {
    final EpisodeService apiEpisodes =
        EpisodeService(http: MockClient(_mockRequest));

    final List<Episode>? episodes = await apiEpisodes.getEpisodes(1);
    expect(episodes!.first.number, returnedEpisodes.first['number']);
  });

}
