import 'package:get_it/get_it.dart';
import 'package:tv_maze/services/episode_service.dart';
import 'package:tv_maze/services/season_service.dart';
import 'package:tv_maze/services/show_service.dart';

final GetIt di = GetIt.instance;

Future<void> initializeDependencyInjection() async{
  // final SharedPreferences prefs = await SharedPreferences.getInstance();
  // di.registerSingleton<SharedPreferences>(prefs);
  
  di.registerSingleton<ShowService>(ShowService());
  di.registerSingleton<SeasonService>(SeasonService());
  di.registerSingleton<EpisodeService>(EpisodeService());
}