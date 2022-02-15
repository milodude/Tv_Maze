import 'package:tv_maze/models/episode.dart';

class EpisodeMapper {
  static Episode map(dynamic episode) {
    try {
      return Episode(
        name: episode['name'],
        number: episode['number'],
        image: episode['image'],
        summary: episode['summary'],
        season: episode['season'],
      );
    } catch (e) {
      throw Exception("Review EpisodeMapper. Failed while mapping!");
    }
  }
}
