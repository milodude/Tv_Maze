import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tv_maze/app_module.dart';
// import 'package:tv_maze/arguments/show_arguments.dart';
import 'package:tv_maze/bloc/episode/episode_bloc.dart';
import 'package:tv_maze/bloc/season/season_bloc.dart';
import 'package:tv_maze/bloc/show/show_bloc.dart';
import 'package:tv_maze/dependency_injection.dart';
import 'package:tv_maze/services/episode_service.dart';
import 'package:tv_maze/services/season_service.dart';
import 'package:tv_maze/services/show_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencyInjection();
  return runApp(ModularApp(module: AppModule(), child: const AppState()));
}

///State of the app. Represents where the blocs are confugured.
class AppState extends StatelessWidget {
  ///constructor
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // ignore: always_specify_types
      providers: [
        BlocProvider<ShowBloc>(create: (_) => ShowBloc(di<ShowService>())),
        BlocProvider<SeasonBloc>(
            create: (_) => SeasonBloc(di<SeasonService>())),
        BlocProvider<EpisodeBloc>(
            create: (_) => EpisodeBloc(di<EpisodeService>())),
      ],
      child: const TvMazeApp(),
    );
  }
}

///Main app for the Maze Tv app
class TvMazeApp extends StatelessWidget {
  ///constructor
  const TvMazeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'TV Maze',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
