import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_maze/arguments/show_arguments.dart';
import 'package:tv_maze/bloc/show/show_bloc.dart';
import 'package:tv_maze/generic_widgets/image_unavailable.dart';
import 'package:tv_maze/models/show.dart';
import 'package:tv_maze/pages/details/show_details_page.dart';

class ExpandedShowsGridView extends StatelessWidget {
  const ExpandedShowsGridView({
    Key? key,
    required this.showList,
  }) : super(key: key);

  final List<Show> showList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          itemCount: showList.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      context.read<ShowBloc>().add(LoadShowDetailsEvent(id: showList[index].id));
                      Navigator.pushNamed(
                        context,
                        ShowDetailsPage.routeName,
                        arguments: ShowArguments(
                          showList[index].id,
                        ),
                      );
                    },
                    child: Card(
                      elevation: 18.0,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: showList[index].image != null
                          ? Image.network(
                              showList[index].image['medium'] ??
                                  showList[index].image['original'],
                              fit: BoxFit.cover,
                              height: 250.0,
                              width: 130.0,
                            )
                          : const ImageUnavailable(),
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.all(8.0),
                    ),
                  ),
                ),
                Text(
                  showList[index].name,
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                )
              ],
            );
          }),
    );
  }
}
