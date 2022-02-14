import 'package:tv_maze/mappers/episode_mapper.dart';
import 'package:tv_maze/models/episode.dart';
import 'package:tv_maze/utils/app_settings.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class EpisodeService {

  Future<List<Episode>?> getEpisodes(int id) async {
    Uri uri = Uri.https(AppSettings.getConnectionString(), '/shows/$id/episodes');
    var response = await http.get(uri, headers: AppSettings.getHeader());
    if (response.statusCode != 200) {
      return null;
    }

    List<dynamic> episodeResponseList = json.decode(response.body);
    List<Episode> fetchedEpisodeList = <Episode>[];

    for (var episode in episodeResponseList) {
      var dto = EpisodeMapper.map(episode);
      fetchedEpisodeList.add(dto);
    }

    return fetchedEpisodeList;
  }
}
