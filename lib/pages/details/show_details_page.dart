import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_maze/bloc/season/season_bloc.dart';
import 'package:tv_maze/bloc/show/show_bloc.dart';
import 'package:tv_maze/generic_widgets/back_floating_action_button.dart';
import 'package:tv_maze/pages/details/show_details.dart';
import 'package:tv_maze/utils/constants.dart';

///Page that presents the details of a show
class ShowDetailsPage extends StatelessWidget {
  ///constructor that takes  a ShowId
  const ShowDetailsPage({Key? key, required this.showId}) : super(key: key);

  ///Route name for this page
  static const String routeName = Constants.showDetailsPageRouteName;

  ///
  final int showId;

  ///Action to be performed when the floating action button is pressed
  void backButtonAction(BuildContext context) {
    context.read<ShowBloc>().add(LoadShowDataEvent());
    context.read<SeasonBloc>().add(ClearSeasonEvent());
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: BlocBuilder<ShowBloc, ShowState>(builder: (
            BuildContext context,
            ShowState state,
          ) {
            if (state is ShowInitialState) {
              context.read<ShowBloc>().add(LoadShowDataEvent());
              context.read<SeasonBloc>().add(LoadSeasonDataEvent(showId));
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  CircularProgressIndicator(),
                ],
              );
            } else if (state is ShowLoadingState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
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
        floatingActionButton:
            BackFloatingActionButton(action: backButtonAction),
      ),
    );
  }
}
