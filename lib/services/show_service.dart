import 'dart:convert';
import 'package:http/http.dart' show Client, Response;
import 'package:tv_maze/mappers/show_mapper.dart';
import 'package:tv_maze/models/show.dart';
import 'package:tv_maze/utils/app_settings.dart';
///Show service class that handles the API requests
class ShowService {
  ///constructor which takes an HTTP Client
  ShowService({required this.http});
  ///Property
  final Client http;

///Method that gets you all the available shows
  Future<List<Show>?> getShows() async {
    Uri uri = Uri.https(AppSettings.getConnectionString(), '/shows');
    Response response = await http.get(uri, headers: AppSettings.getHeader());
    if (response.statusCode != 200) {
      return null;
    }

    List<dynamic> showsResponseList = json.decode(response.body);
    List<Show> fetchedShowList = <Show>[];
    for (dynamic show in showsResponseList) {
      Show dto = ShowMapper.map(show);
      fetchedShowList.add(dto);
    }

    return fetchedShowList;
  }
///Method that allows you to search for a List of show. A string parameter is
/// required to perform the search.
  Future<List<Show>?> searchShows(String query) async {
    Uri uri = Uri(
      scheme: 'https',
      host: AppSettings.getConnectionString(),
      path: '/search/shows',
      // ignore: always_specify_types
      queryParameters: {'q': query},
    );

    Response response = await http.get(uri, headers: AppSettings.getHeader());
    if (response.statusCode != 200) {
      return null;
    }

    List<dynamic> showsResponseList = json.decode(response.body);
    List<Show> fetchedShowList = <Show>[];

    for (dynamic show in showsResponseList) {
      Show dto = ShowMapper.map(show['show']);
      fetchedShowList.add(dto);
    }

    return fetchedShowList;
  }

///Method that allows you to search for an specific show data
  Future<Show?> searchShow(int id) async {
    Uri uri = Uri.https(AppSettings.getConnectionString(), '/shows/$id');
    Response response = await http.get(uri, headers: AppSettings.getHeader());
    if (response.statusCode != 200) {
      return null;
    }

    dynamic showsResponse = json.decode(response.body);

    return ShowMapper.map(showsResponse);
  }
}
