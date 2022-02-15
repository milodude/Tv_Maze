import 'package:tv_maze/models/show.dart';

class ShowMapper {
  static Show map(dynamic show) {
    try {
      return Show(
        name: show['name'] ?? '',
        id: show['id'],
        image: show['image'],
        summary: show['summary'] ?? '',
        schedule: show['schedule'],
        status: show['status'] ?? '',
        genres: show['genres'],
      );
    } catch (e) {
      throw Exception(
          "Review ShowMapper. Failed while mapping! ${e.toString()}");
    }
  }
}
