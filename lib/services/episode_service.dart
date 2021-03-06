import 'package:tv_maze/mappers/episode_mapper.dart';
import 'package:tv_maze/models/episode.dart';
import 'package:tv_maze/utils/app_settings.dart';
import 'dart:convert';
import 'package:http/http.dart' show Client, Response;

///Episode service class that handles the API requests
class EpisodeService {
  ///constructor which takes an HTTP Client
    EpisodeService({required this.http});
    ///Property
   final Client http;

  ///Method that gets all episodes for a season. Season Id is required
  Future<List<Episode>?> getEpisodes(int seasonId) async {
    Uri uri = Uri.https(
        AppSettings.getConnectionString(), '/seasons/$seasonId/episodes');
    Response response = await http.get(
      uri,
      headers: AppSettings.getHeader(),
    );
    if (response.statusCode != 200) {
      return null;
    }

    List<dynamic> episodeResponseList = json.decode(response.body);
    List<Episode> fetchedEpisodeList = <Episode>[];

    for (dynamic episode in episodeResponseList) {
      Episode dto = EpisodeMapper.map(episode);
      fetchedEpisodeList.add(dto);
    }

    return fetchedEpisodeList;
  }
}
