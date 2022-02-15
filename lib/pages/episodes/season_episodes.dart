import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_maze/bloc/episode/episode_bloc.dart';
import 'package:tv_maze/generic_widgets/dropdown_season.dart';
import 'package:tv_maze/models/season.dart';
import 'package:tv_maze/pages/episodes/episodes_list.dart';
import 'package:tv_maze/utils/constants.dart';

class SeasonEpisodes extends StatefulWidget {
  const SeasonEpisodes({
    Key? key,
    required this.seasonList,
  }) : super(key: key);

  final List<Season> seasonList;

  @override
  State<SeasonEpisodes> createState() => _SeasonEpisodesState();
}

class _SeasonEpisodesState extends State<SeasonEpisodes> {
  late Season selectedSeason = widget.seasonList[0];

  _setSelectedSeason(Season season) {
    setState(() {
      selectedSeason = season;
    });
    context.read<EpisodeBloc>().add(LoadEpisodeDataEvent(season.id));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Season', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            const SizedBox(width: 10,),
            DropdownSeasons(
                _setSelectedSeason, widget.seasonList, widget.seasonList[0]),
          ],
        ),
        const Divider(
          color: Colors.purple,
        ),
        BlocBuilder<EpisodeBloc, EpisodeState>(
          builder: (context, state) {
            if (state is EpisodeInitialState) {
              context
                  .read<EpisodeBloc>()
                  .add(LoadEpisodeDataEvent(selectedSeason.id));
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
              return EpisodesList(episodes: state.episodeList);
            } else if (state is EpisodeErrorState) {
              return const Text(Constants.blocErrorText);
            }

            return const Text(Constants.blocErrorWhileLoadingText + 'Episodes!');
          },
        ),
      ],
    );
  }
}
