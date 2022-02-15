import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_maze/arguments/show_arguments.dart';
import 'package:tv_maze/bloc/season/season_bloc.dart';
import 'package:tv_maze/bloc/show/show_bloc.dart';
import 'package:tv_maze/generic_widgets/image_unavailable.dart';
import 'package:tv_maze/models/show.dart';
import 'package:tv_maze/pages/details/show_details_page.dart';
import 'package:tv_maze/pages/search/search_no_results_found.dart';
import 'package:tv_maze/utils/constants.dart';

class ExpandedShowsGridView extends StatelessWidget {
  const ExpandedShowsGridView({
    Key? key,
    required this.showList,
  }) : super(key: key);

  final List<Show> showList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      key: const Key(Constants.gridViewExpandedKey),
      child: showList.isEmpty
          ? const SearchNoResultsFound()
          : GridView.builder(
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
                      child: Card(
                        key: const Key(Constants.gridViewCardKey),
                        child: Hero(
                          tag: showList[index].id.toString(),
                          child: Material(
                            child: InkWell(
                              key: const Key(Constants.gridViewInkwellKey),
                              onTap: () {
                                context.read<ShowBloc>().add(
                                    LoadShowDetailsEvent(
                                        id: showList[index].id));
                                context.read<SeasonBloc>().add(
                                    LoadSeasonDataEvent(showList[index].id));

                                Navigator.pushNamed(
                                  context,
                                  ShowDetailsPage.routeName,
                                  arguments: ShowArguments(
                                    showList[index].id,
                                  ),
                                );
                              },
                              child: GridTile(
                                key: const Key(Constants.gridViewTileKey),
                                footer: Opacity(
                                  opacity: 0.6,
                                  child: Container(
                                    color: const Color.fromARGB(
                                        255, 246, 241, 247),
                                    child: ListTile(
                                      dense: true,
                                      leading: Text(
                                        showList[index].name,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                child: showList[index].image != null
                                    ? Image.network(
                                        showList[index].image[Constants.imageSizeMedium] ??
                                            showList[index].image[Constants.imageSizeOriginal],
                                        fit: BoxFit.cover,
                                        height: 250.0,
                                        width: 130.0,
                                      )
                                    : const ImageUnavailable(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
    );
  }
}