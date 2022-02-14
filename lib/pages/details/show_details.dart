import 'package:flutter/material.dart';
import 'package:tv_maze/generic_widgets/button.dart';
import 'package:tv_maze/models/show.dart';
import 'package:tv_maze/pages/episodes/episodes_page.dart';

class ShowDetails extends StatelessWidget {
  const ShowDetails({Key? key, required this.show}) : super(key: key);

  final Show show;

  Widget _getBody(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width,
          height: size.height * 0.6,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(show.image != null
                  ? show.image['medium'] ?? show.image['original']
                  : const AssetImage('assets/images/unavailable-image.jpg')),
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
                children: [
                  //row y expanded si necesito corazon.
                  Row(
                    children: [
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
                    children: [
                      _getGenres(),
                      _getScheduled(),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Button(texto: 'Seasons & Episodes', color: Colors.purpleAccent,tamano: 15, accion:() => _sendToEpisodesPage(context))
                    ],
                  ),
                 
                  const Divider(color: Colors.purple, height: 10),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      Flexible(
                          child: Text(
                        show.formatSummary(),
                        softWrap: true,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontStyle: FontStyle.normal),
                      ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
  Future<void> _sendToEpisodesPage(BuildContext context) async {
    Navigator.pushNamed(context, EpisodePage.routeName);
  }

  Widget _getGenres(){
     late String genres;
     if(show.genres == null){
       genres = 'Not available'; 
     }else{
       var aux = List<String>.from(show.genres);
       genres = aux.join(', ');
     }

     return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 3.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1.0),
          color: Colors.purple, borderRadius: BorderRadius.circular(7.0)),
      child: Text(
        genres,
        style:const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _getScheduled() {
    if (show.status == 'Ended') {
      return const Text('Show Ended');
    }

    if (show.status == 'To Be Determined') {
      return const Text('Schedule to be determined');
    }
    var hasDays = show.schedule['days'] != null;
    var hasTime = show.schedule['time'] != null;
    if (hasDays && hasTime) {
      return Text(
          '${show.schedule['days'].join(',')} at ${show.schedule['time']}');
    } else if (hasDays) {
      return Text(show.schedule['days'].join(','));
    }

    return Text('At ${show.schedule['time']}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _getBody(context)),
    );
  }
}
