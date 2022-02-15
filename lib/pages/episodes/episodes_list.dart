import 'package:flutter/material.dart';
import 'package:tv_maze/models/episode.dart';
import 'dart:math';

import 'package:tv_maze/utils/constants.dart';

///Widget that renders all of the episodes
class EpisodesList extends StatelessWidget {
  ///Constructor that takes a list of episodes
  EpisodesList({Key? key, required this.episodes}) : super(key: key);
  ///Parameter list of episodes. 
  final List<Episode>? episodes;
  final Random _random = Random();

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = <Color>[
      Colors.black,
      Colors.blueAccent,
      Colors.purpleAccent,
      Colors.redAccent,
      Colors.redAccent,
      Colors.greenAccent,
      Colors.amberAccent,
      Colors.cyanAccent,
      Colors.tealAccent
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        for (int i = 0; i < episodes!.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              title: Text(
                  '#${episodes!.elementAt(i).number == null ? '' : episodes!.elementAt(i).number?.toString()}. ${episodes!.elementAt(i).name}'),
              subtitle: Text(episodes!.elementAt(i).formatSummary()),
              leading: episodes!.elementAt(i).image != null
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(
                        episodes!
                                .elementAt(i)
                                .image[Constants.imageSizeMedium] ??
                            episodes!
                                .elementAt(i)
                                .image[Constants.imageSizeOriginal],
                      ),
                    )
                  : const CircleAvatar(
                      backgroundImage:
                          AssetImage(Constants.imageUnavailablePath)),
              trailing: Icon(
                Icons.movie,
                color: colors[_random.nextInt(colors.length)],
              ),
              isThreeLine: true,
            ),
          ),
      ],
    );
  }
}
