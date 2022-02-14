import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_maze/bloc/show/show_bloc.dart';
import 'package:tv_maze/pages/details/show_details.dart';

class ShowDetailsPage extends StatelessWidget {
  const ShowDetailsPage({Key? key, required this.showId}) : super(key: key);

  static const routeName = 'showDetails';
  final int showId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: BlocBuilder<ShowBloc, ShowState>(
            builder: (context, state) {

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
              } else if (state is ShowLoadedState) {
                return ShowDetails(show: state.show);
              } else if (state is ShowErrorState) {
                return const Text('Something went wrong!');
              }

              return const Text('Error while loading shows!');
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
              Navigator.pop(context);
            }),
      ),
    );
  }
}
