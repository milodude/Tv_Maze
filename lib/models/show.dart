class Show {
  int id;
  String name;
  dynamic image;
  String summary;
  dynamic schedule;
  String status;
  dynamic genres;

  Show({
    required this.id,
    required this.name,
    required this.image,
    required this.summary,
    required this.schedule,
    required this.status,
    required this.genres
  });

  String formatSummary(){
    return summary.replaceAll(RegExp('<p>'), '').replaceAll(RegExp('<b>'), '').replaceAll(RegExp('</p>'), '').replaceAll(RegExp('</b>'), '');
  }
}
