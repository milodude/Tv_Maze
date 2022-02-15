import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:tv_maze/mappers/show_mapper.dart';
import 'package:tv_maze/models/show.dart';
import 'package:tv_maze/utils/app_settings.dart';
///Show service class that handles the API requests
class ShowService {
  ///constructor which takes an HTTP Client
  ShowService(this.http);
  ///Property
  final Client http;

///Method that gets you all the available shows
  Future<List<Show>?> getShows() async {
    Uri uri = Uri.https(AppSettings.getConnectionString(), '/shows');
    var response = await http.get(uri, headers: AppSettings.getHeader());
    if (response.statusCode != 200) {
      return null;
    }

    List<dynamic> showsResponseList = json.decode(response.body);
    List<Show> fetchedShowList = <Show>[];
    for (var show in showsResponseList) {
      var dto = ShowMapper.map(show);
      fetchedShowList.add(dto);
    }

    return fetchedShowList;
  }
///Method that allows you to search for a List of show. A string parameter is required to perform the search.
  Future<List<Show>?> searchShows(String query) async {
    var uri = Uri(
      scheme: 'https',
      host: AppSettings.getConnectionString(),
      path: '/search/shows',
      queryParameters: {'q': query},
    );

    var response = await http.get(uri, headers: AppSettings.getHeader());
    if (response.statusCode != 200) {
      return null;
    }

    List<dynamic> showsResponseList = json.decode(response.body);
    List<Show> fetchedShowList = <Show>[];

    for (var show in showsResponseList) {
      var dto = ShowMapper.map(show['show']);
      fetchedShowList.add(dto);
    }

    return fetchedShowList;
  }

///Method that allows you to search for an specific show data
  Future<Show?> searchShow(int id) async {
    Uri uri = Uri.https(AppSettings.getConnectionString(), '/shows/$id');
    var response = await http.get(uri, headers: AppSettings.getHeader());
    if (response.statusCode != 200) {
      return null;
    }

    dynamic showsResponse = json.decode(response.body);

    return ShowMapper.map(showsResponse);
  }
}
