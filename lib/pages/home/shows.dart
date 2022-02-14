import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_maze/bloc/show/show_bloc.dart';
import 'package:tv_maze/generic_widgets/expanded_show_grid_view.dart';
import 'package:tv_maze/services/show_service.dart';

class Shows extends StatefulWidget {
  const Shows({Key? key, required this.showService}) : super(key: key);

  final ShowService showService;

  @override
  _ShowsState createState() => _ShowsState();
}

class _ShowsState extends State<Shows> {
  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: MediaQuery.of(context).size.height - 130,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BlocBuilder<ShowBloc, ShowState>(builder: (context, state) {
            if (state is ShowInitialState) {
              context.read<ShowBloc>().add(LoadShowDataEvent());
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:const [
                  CircularProgressIndicator(),
                ],
              );
            } else if (state is ShowLoadingState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:const [
                  CircularProgressIndicator(),
                ],
              );
            } else if (state is ShowListLoadedState) {
              return ExpandedShowsGridView(showList: state.showList);
            } else if (state is ShowErrorState) {
              return const Text('Something went wrong!');
            }

            return const Text('Error while loading shows!');
          })
        ],
      ),
    );
  }
}
