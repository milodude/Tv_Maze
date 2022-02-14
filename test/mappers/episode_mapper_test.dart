import 'package:flutter_test/flutter_test.dart';
import 'package:tv_maze/mappers/episode_mapper.dart';
import 'package:tv_maze/models/episode.dart';

void main() {
  dynamic episode;
  setUp(() {
     episode = {
        "name": "Pilot",
        "season": 1,
        "number": 1,
        "image": {
            "medium": "https://static.tvmaze.com/uploads/images/medium_landscape/1/4388.jpg",
            "original": "https://static.tvmaze.com/uploads/images/original_untouched/1/4388.jpg"
        },
        "summary": "<p>When the residents of <b>Chester's Mill</b> find themselves trapped under a massive transparent dome with no way out, they struggle to survive as resources rapidly dwindle and panic quickly escalates.</p>",
    };
  });
  testWidgets('episode mapper: should map properties properly', (tester) async {
    var mappedEpisode = EpisodeMapper.map(episode);
    expect(mappedEpisode, isA<Episode>());
  });
}