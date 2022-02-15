import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_maze/bloc/season/season_bloc.dart';
import 'package:tv_maze/bloc/show/show_bloc.dart';
import 'package:tv_maze/pages/details/show_details.dart';
import 'package:tv_maze/utils/constants.dart';

class ShowDetailsPage extends StatelessWidget {
  const ShowDetailsPage({Key? key, required this.showId}) : super(key: key);

  static const routeName = Constants.showDetailsPageRouteName;
  final int showId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: BlocBuilder<ShowBloc, ShowState>(builder: (context, state) {
            if (state is ShowInitialState) {
              context.read<ShowBloc>().add(LoadShowDataEvent());
              context.read<SeasonBloc>().add(LoadSeasonDataEvent(showId));
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                ],
              );
            } else if (state is ShowLoadingState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                ],
              );
            } else if (state is ShowLoadedState) {
              return ShowDetails(show: state.show);
            } else if (state is ShowErrorState) {
              return const Text(Constants.blocErrorText);
            }

            return const Text(Constants.blocErrorWhileLoadingText + 'Shows!');
          }),
        ),
        extendBodyBehindAppBar: true,
        floatingActionButton: FloatingActionButton(
          mini: true,
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            context.read<ShowBloc>().add(LoadShowDataEvent());
            context.read<SeasonBloc>().add(ClearSeasonEvent());
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
