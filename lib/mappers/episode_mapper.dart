import 'package:tv_maze/models/episode.dart';

///Mapper for an Episode. It takes a dynamic vallue to cast.
class EpisodeMapper {
  ///Map method that gets an episode of type dynamic and retrieves an Episode.
  static Episode map(dynamic episode) {
    try {
      return Episode(
        name: episode['name'] ?? '',
        number: episode['number'],
        image: episode['image'],
        summary: episode['summary'] ?? '',
        season: episode['season'],
      );
    } catch (e) {
      throw Exception('Review EpisodeMapper. Failed while mapping!');
    }
  }
}
