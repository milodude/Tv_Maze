import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_maze/bloc/show/show_bloc.dart';
import 'package:tv_maze/generic_widgets/expanded_show_grid_view.dart';
import 'package:tv_maze/utils/constants.dart';

///Widget that renders a lis of  shows
class Shows extends StatefulWidget {
  ///Copnstructor that takes a showService as a parameter
  const Shows({Key? key}) : super(key: key);

  @override
  _ShowsState createState() => _ShowsState();
}

class _ShowsState extends State<Shows> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          BlocBuilder<ShowBloc, ShowState>(builder: (
            BuildContext context,
            ShowState state,
          ) {
            if (state is ShowInitialState) {
              context.read<ShowBloc>().add(LoadShowDataEvent());
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
            } else if (state is ShowListLoadedState) {
              return ExpandedShowsGridView(showList: state.showList);
            } else if (state is ShowErrorState) {
              return const Text(Constants.blocErrorText + 'Shows!');
            }

            return const Text(Constants.blocErrorWhileLoadingText);
          })
        ],
      ),
    );
  }
}
