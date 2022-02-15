import 'package:flutter/material.dart';
import 'package:tv_maze/arguments/show_arguments.dart';
import 'package:tv_maze/generic_widgets/button.dart';
import 'package:tv_maze/models/show.dart';
import 'package:tv_maze/pages/episodes/episodes_page.dart';
import 'package:tv_maze/utils/constants.dart';

///Widget that renders the details of a show
class ShowDetails extends StatelessWidget {
  ///Constructor which takes a show
  const ShowDetails({Key? key, required this.show}) : super(key: key);

  ///
  final Show show;

  Widget _getBody(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Container(
          width: size.width,
          height: size.height * 0.6,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(show.image != null
                  ? show.image[Constants.imageSizeMedium] ??
                      show.image[Constants.imageSizeOriginal]
                  : const AssetImage(Constants.imageUnavailablePath)),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: size.height * 0.5,
            width: size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        show.name,
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      _getGenres(),
                      _getScheduled(),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Button(
                          texto: 'Seasons & Episodes',
                          color: Colors.purpleAccent,
                          tamano: 15,
                          accion: () => _sendToEpisodesPage(context, show.id))
                    ],
                  ),
                  const Divider(color: Colors.purple, height: 10),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: size.height * 0.27,
                    child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
                      Text(
                        show.formatSummary(),
                        // softWrap: true,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontStyle: FontStyle.normal),
                      )
                    ]),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _sendToEpisodesPage(BuildContext context, int showId) async {
    Navigator.pushNamed(
      context,
      EpisodePage.routeName,
      arguments: ShowArguments(
        showId,
      ),
    );
  }

  Widget _getGenres() {
    late String genres;
    if (show.genres == null) {
      genres = 'Not available';
    } else {
      List<String> aux = List<String>.from(show.genres);
      genres = aux.join(', ');
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 3.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1.0),
          color: Colors.purple,
          borderRadius: BorderRadius.circular(7.0)),
      child: Text(
        genres,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _getScheduled() {
    if (show.status == Constants.showStatusEnded) {
      return const Text('Show Ended');
    }

    if (show.status == Constants.showStatusToBeDetermined) {
      return const Text('Schedule to be determined');
    }
    bool hasDays = show.schedule[Constants.showScheduleDays] != null;
    bool hasTime = show.schedule[Constants.showScheduleTime] != null;
    if (hasDays && hasTime) {
      return Text(
          '${show.schedule[Constants.showScheduleDays].join(',')} at ${show.schedule[Constants.showScheduleTime]}');
    } else if (hasDays) {
      return Text(show.schedule[Constants.showScheduleDays].join(','));
    }

    return Text('At ${show.schedule[Constants.showScheduleTime]}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _getBody(context)),
    );
  }
}
