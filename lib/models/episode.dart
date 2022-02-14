class Episode {
  String name;
  int number;
  int season;
  String summary;
  dynamic image;

  Episode({
    required this.name,
    required this.number,
    required this.season,
    required this.summary,
    required this.image
  });

  String formatSummary(){
    return summary.replaceAll(RegExp('<p>'), '').replaceAll(RegExp('<b>'), '').replaceAll(RegExp('</p>'), '').replaceAll(RegExp('</b>'), '');
  }
}
