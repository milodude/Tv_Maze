import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_maze/bloc/season/season_bloc.dart';
import 'package:tv_maze/pages/episodes/season_episodes.dart';

class EpisodePage extends StatelessWidget {
  const EpisodePage({Key? key, required this.showId}) : super(key: key);
  final int showId;
  static const routeName = 'showEpisodes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Season & Episodes"),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<SeasonBloc, SeasonState>(
        builder: (context, state) {
          if (state is SeasonInitialState) {
            context.read<SeasonBloc>().add(LoadSeasonDataEvent(showId));
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
              ],
            );
          } else if (state is SeasonLoadingState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
              ],
            );
          } else if (state is SeasonLoadedState) {
            return SeasonEpisodes(seasonList: state.seasonList);
          } else if (state is SeasonErrorState) {
            return const Text('Something went wrong!');
          }

          return const Text('Error while loading shows!');
        },
      ),
      floatingActionButton: FloatingActionButton(
          mini: true,
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }
}




