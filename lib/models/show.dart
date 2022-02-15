///Class that represents a show
class Show {
  ///Constructor
  Show(
      {required this.id,
      required this.name,
      required this.image,
      required this.summary,
      required this.schedule,
      required this.status,
      required this.genres});
///Id of a show
  int id;
  ///Shows name
  String name;
  ///Poster of the show. It can have 2 sizes medium or original.
  dynamic image;
  ///Brief recap on what the show consists of
  String summary;
  ///Times that  the show is or was played in the tv
  dynamic schedule;
  ///Status of the show. IE:Ended, To Be Determined, Running
  String status;
  ///Categories of the show
  dynamic genres;

  ///Method that formats the summary field in order to have a clean string.
  String formatSummary() {
    return summary
        .replaceAll(RegExp('<p>'), '')
        .replaceAll(RegExp('<b>'), '')
        .replaceAll(RegExp('</p>'), '')
        .replaceAll(RegExp('</b>'), '');
  }
}
