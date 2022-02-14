import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_maze/bloc/episode/episode_bloc.dart';
import 'package:tv_maze/bloc/season/season_bloc.dart';
import 'package:tv_maze/models/season.dart';
import 'package:tv_maze/pages/episodes/season_list.dart';

class SeasonCollapse extends StatelessWidget {
  const SeasonCollapse(
      {Key? key,
      required this.seasonList,
      required this.title,
      required this.season})
      : super(key: key);
  final List<Season> seasonList;
  final String title;
  final int season;

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      initialExpanded: true,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: <Widget>[
              ScrollOnExpand(
                scrollOnExpand: true,
                scrollOnCollapse: false,
                child: ExpandablePanel(
                  theme: const ExpandableThemeData(
                    useInkWell: true,
                    inkWellBorderRadius: BorderRadius.all(Radius.circular(50)),
                    iconColor: Colors.purple,
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    tapBodyToCollapse: true,
                  ),
                  header: Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.2),
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  collapsed: const Text(
                    '',
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  expanded: BlocBuilder<EpisodeBloc, EpisodeState>(
                    builder: (context, state) {
                      if (state is EpisodeInitialState) {
                        context
                            .read<EpisodeBloc>()
                            .add(LoadEpisodeDataEvent(seasonList[0].id));
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(),
                          ],
                        );
                      } else if (state is EpisodeLoadingState) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(),
                          ],
                        );
                      } else if (state is EpisodeLoadedState) {
                        var filteredEpisodes = state.episodeList!
                            .where((element) => element.season == season)
                            .toList();
                        return SeasonList(episodes: filteredEpisodes);
                      } else if (state is SeasonErrorState) {
                        return const Text('Something went wrong!');
                      }

                      return const Text('Error while loading shows!');
                    },
                  ),
                  builder: (_, collapsed, expanded) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, bottom: 10),
                      child: Expandable(
                        collapsed: collapsed,
                        expanded: expanded,
                        theme: const ExpandableThemeData(crossFadePoint: 0),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
