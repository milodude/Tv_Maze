import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_maze/bloc/episode/episode_bloc.dart';
import 'package:tv_maze/bloc/season/season_bloc.dart';
import 'package:tv_maze/generic_widgets/back_floating_action_button.dart';
import 'package:tv_maze/pages/episodes/season_episodes.dart';
import 'package:tv_maze/utils/constants.dart';

///Episodes page where you can see all of the seasons episodes
class EpisodePage extends StatefulWidget {
  ///Constructor that takes a show id as a parameter
  const EpisodePage({Key? key, required this.showId}) : super(key: key);
  ///Parameter show id
  final int showId;
  ///Route name for this page
  static const String routeName = Constants.showEpisodesPageRouteName;

  @override
  State<EpisodePage> createState() => _EpisodePageState();
}

///Method to execute when the floating action back button is pressed
void backButtonAction(BuildContext context) {
  context.read<EpisodeBloc>().add(ClearEpisodesEvent());
  Navigator.pop(context);
}

class _EpisodePageState extends State<EpisodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Season & Episodes'),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<SeasonBloc, SeasonState>(
        builder: (BuildContext context, SeasonState state) {
          if (state is SeasonInitialState) {
            context.read<SeasonBloc>().add(LoadSeasonDataEvent(widget.showId));
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                CircularProgressIndicator(),
              ],
            );
          } else if (state is SeasonLoadingState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                CircularProgressIndicator(),
              ],
            );
          } else if (state is SeasonLoadedState) {
            context
                .read<EpisodeBloc>()
                .add(LoadEpisodeDataEvent(state.seasonList[0].id));
            return SeasonEpisodes(seasonList: state.seasonList);
          } else if (state is SeasonErrorState) {
            return const Text(Constants.blocErrorText);
          }

          return const Text(Constants.blocErrorText + 'Episodes!');
        },
      ),
      floatingActionButton:
          const BackFloatingActionButton(action: backButtonAction),
    );
  }
}
