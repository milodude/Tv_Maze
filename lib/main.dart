import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_maze/arguments/show_arguments.dart';
import 'package:tv_maze/bloc/episode/episode_bloc.dart';
import 'package:tv_maze/bloc/season/season_bloc.dart';
import 'package:tv_maze/bloc/show/show_bloc.dart';
import 'package:tv_maze/dependency_injection.dart';
import 'package:tv_maze/pages/details/show_details_page.dart';
import 'package:tv_maze/pages/episodes/episodes_page.dart';
import 'package:tv_maze/pages/home/home_page.dart';
import 'package:tv_maze/pages/search/search_show_page.dart';
import 'package:tv_maze/services/episode_service.dart';
import 'package:tv_maze/services/season_service.dart';
import 'package:tv_maze/services/show_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencyInjection();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ShowBloc>(create: (_) => ShowBloc(di<ShowService>())),
        BlocProvider<SeasonBloc>(create: (_) => SeasonBloc(di<SeasonService>())),
        BlocProvider<EpisodeBloc>(create: (_) => EpisodeBloc(di<EpisodeService>())),

      ],
      child: const TvMazeApp(),
    );
  }
}

class TvMazeApp extends StatelessWidget {
  const TvMazeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TV Maze',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: SafeArea(
          child: HomePage(
        title: 'Home',
        showService: di<ShowService>(),
      )),
      initialRoute: HomePage.routeName,
      routes: {
        SearchShowPage.routeName: (_) => const SearchShowPage(),
      },
      onGenerateRoute: (settings) {
        // If you push the PassArguments route
        if (settings.name == ShowDetailsPage.routeName) {
          final args = settings.arguments as ShowArguments;
          return MaterialPageRoute(
            builder: (context) {
              return ShowDetailsPage(showId: args.showId,);
            },
          );
        }

        if (settings.name == EpisodePage.routeName) {
          final args = settings.arguments as ShowArguments;
          return MaterialPageRoute(
            builder: (context) {
              return EpisodePage(showId: args.showId,);
            },
          );
        }
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
    );
  }
}
