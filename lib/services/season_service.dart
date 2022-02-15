import 'package:tv_maze/mappers/season_mapper.dart';
import 'package:tv_maze/models/season.dart';
import 'package:tv_maze/utils/app_settings.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

///Season service class that handles the API requests
class SeasonService {
///Method that get all season by show id
  Future<List<Season>?> getSeasons(int showId) async {
    Uri uri = Uri.https(AppSettings.getConnectionString(), '/shows/$showId/seasons');
    var response = await http.get(uri, headers: AppSettings.getHeader());
    if (response.statusCode != 200) {
      return null;
    }

    List<dynamic> seasonResponseList = json.decode(response.body);
    List<Season> fetchedSeasonList = <Season>[];

    for (var season in seasonResponseList) {
      var dto = SeasonMapper.map(season);
      fetchedSeasonList.add(dto);
    }

    return fetchedSeasonList;
  }
}
