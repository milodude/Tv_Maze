import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tv_maze/pages/details/show_details_page.dart';
import 'package:tv_maze/pages/episodes/episodes_page.dart';
// import 'package:tv_maze/main.dart';
import 'package:tv_maze/pages/home/home_page.dart';
import 'package:tv_maze/pages/search/search_show_page.dart';
import 'package:tv_maze/utils/constants.dart';

///class that inherits from the Module class, overriding the binds and routes
///properties. With this we have a route and injection mechanism separate from
///the application and can be both applied in a global context
class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => <Bind<Object>>[];

  @override
  List<ModularRoute> get routes => <ModularRoute>[
        ChildRoute<dynamic>(
          HomePage.routeName,
          child: (
            BuildContext context,
            dynamic args,
          ) =>
              const HomePage(
            title: '',
          ),
        ),

        ChildRoute<dynamic>(
          SearchShowPage.routeName,
          child: (BuildContext context, dynamic args) => const SearchShowPage(),
        ),

        ChildRoute<dynamic>(
          // ShowDetailsPage.routeName,
          '${Constants.showDetailsPageRouteName}/:showId',
          // ignore: always_specify_types
          child: (BuildContext context, args) =>
              ShowDetailsPage(showId: int.parse(args.params['showId'])),
        ),

         ChildRoute<dynamic>(
          '${Constants.showEpisodesPageRouteName}/:showId',
          // ignore: always_specify_types
          child: (BuildContext context, args) =>
              EpisodePage(showId: int.parse(args.params['showId'])),
        ),
      ];
}
