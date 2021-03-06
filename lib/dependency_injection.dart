import 'package:get_it/get_it.dart';
import 'package:tv_maze/services/episode_service.dart';
import 'package:tv_maze/services/season_service.dart';
import 'package:tv_maze/services/show_service.dart';
import 'package:http/http.dart' show Client;
///Property which lets you access an instances of the dependency inyector.
final GetIt di = GetIt.instance;

///Method that initializes the dependency inyection
Future<void> initializeDependencyInjection() async {
  Client client = Client();
  di.registerSingleton<Client>(client);

  di.registerSingleton<ShowService>(ShowService(http: client));
  di.registerSingleton<SeasonService>(SeasonService(http: client));
  di.registerSingleton<EpisodeService>(EpisodeService(http: client));
}
