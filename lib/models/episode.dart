///Class that represents an Episode
class Episode {
  ///Constructor
  Episode(
      {required this.name,
      required this.number,
      required this.season,
      required this.summary,
      required this.image});

  ///Name of the episode
  String name;

  ///Episode number
  int number;

  ///Season of the episode
  int season;

  ///Brief recap of the episode
  String summary;

  ///Image of the episode
  dynamic image;

  ///Method that formats the summary field in order to have a clean string.
  String formatSummary() {
    return summary
        .replaceAll(RegExp('<p>'), '')
        .replaceAll(RegExp('<b>'), '')
        .replaceAll(RegExp('</p>'), '')
        .replaceAll(RegExp('</b>'), '');
  }
}
