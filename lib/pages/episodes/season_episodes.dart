import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:tv_maze/models/season.dart';
import 'package:tv_maze/pages/episodes/season_collapse.dart';

class SeasonEpisodes extends StatefulWidget {
  const SeasonEpisodes({
    Key? key,
    required this.seasonList,
  }) : super(key: key);

  final List<Season> seasonList;

  @override
  State<SeasonEpisodes> createState() => _SeasonEpisodesState();
}

class _SeasonEpisodesState extends State<SeasonEpisodes> {

  Widget _getCollapses(List<Season> seasonList){
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,

      child: ListView.builder(
                // the number of items in the list
                itemCount: seasonList.length,
    
                // display each item of the product list
                itemBuilder: (context, index) {
                  return SeasonCollapse(seasonList: seasonList,title: 'Season ${index + 1} episodes',season: index + 1);
                }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ExpandableTheme(
      data: const ExpandableThemeData(
        iconColor: Colors.blue,
        useInkWell: true,
      ),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          const Divider(
            color: Colors.purple,
          ),
          _getCollapses(widget.seasonList),
        ],
      ),
    );
  }
}
