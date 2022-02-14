import 'package:tv_maze/mappers/season_mapper.dart';
import 'package:tv_maze/models/season.dart';
import 'package:tv_maze/utils/app_settings.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SeasonService {

  Future<List<Season>?> getSeasons(int id) async {
    Uri uri = Uri.https(AppSettings.getConnectionString(), '/shows/$id/seasons');
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
