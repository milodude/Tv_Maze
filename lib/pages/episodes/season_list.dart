import 'package:flutter/material.dart';
import 'package:tv_maze/models/episode.dart';
import 'dart:math';

class SeasonList extends StatelessWidget {
  SeasonList({Key? key, required this.episodes}) : super(key: key);
  final List<Episode>? episodes;
  final random = Random();

  @override
  Widget build(BuildContext context) {
    final colors = <Color>[
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
        for (var i = 0; i < episodes!.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              title: Text(
                  '#${episodes!.elementAt(i).number.toString()}. ${episodes!.elementAt(i).name}'),
              subtitle: Text(episodes!.elementAt(i).formatSummary()),
              leading: episodes!.elementAt(i).image != null
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(
                        episodes!.elementAt(i).image['medium'] ??
                            episodes!.elementAt(i).image['original'],
                      ),
                    )
                  : const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/unavailable-image.jpg')),
              trailing: Icon(
                Icons.movie,
                color: colors[random.nextInt(colors.length)],
              ),
              isThreeLine: true,
            ),
          ),
      ],
    );
  }
}
