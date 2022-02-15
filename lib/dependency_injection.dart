import 'package:get_it/get_it.dart';
import 'package:tv_maze/services/episode_service.dart';
import 'package:tv_maze/services/season_service.dart';
import 'package:tv_maze/services/show_service.dart';
import 'package:http/http.dart' show Client;
///Property which lets you access an instances of the dependency inyector.
final GetIt di = GetIt.instance;

///Method that initializes the dependency inyection
Future<void> initializeDependencyInjection() async {
  var client = Client();
  di.registerSingleton<Client>(client);

  di.registerSingleton<ShowService>(ShowService(client));
  di.registerSingleton<SeasonService>(SeasonService());
  di.registerSingleton<EpisodeService>(EpisodeService());
}
