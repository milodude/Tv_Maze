import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tv_maze/bloc/season/season_bloc.dart';
import 'package:tv_maze/bloc/show/show_bloc.dart';
import 'package:tv_maze/generic_widgets/image_unavailable.dart';
import 'package:tv_maze/models/show.dart';
import 'package:tv_maze/pages/search/search_no_results_found.dart';
import 'package:tv_maze/utils/constants.dart';

///Widget that shows you a list of shows
class ExpandedShowsGridView extends StatelessWidget {
  ///Constructor that takes  a list of shows.
  const ExpandedShowsGridView({
    Key? key,
    required this.showList,
  }) : super(key: key);

  ///Parameter. A list of shows.
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
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: Card(
                        key: const Key(Constants.gridViewCardKey),
                        child: Hero(
                          tag: showList[index].id.toString(),
                          child: Material(
                            child: InkWell(
                              key: const Key(Constants.gridViewInkwellKey),
                              onTap: () {
                                ReadContext(context).read<ShowBloc>().add(
                                    LoadShowDetailsEvent(
                                        id: showList[index].id));
                                ReadContext(context).read<SeasonBloc>().add(
                                    LoadSeasonDataEvent(showList[index].id));

                                Modular.to.pushNamed('${Constants.showDetailsPageRouteName}/${showList[index].id}');
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
                                        showList[index].image[
                                                Constants.imageSizeMedium] ??
                                            showList[index].image[
                                                Constants.imageSizeOriginal],
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
