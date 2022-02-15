import 'package:tv_maze/models/season.dart';

class SeasonMapper {
  static Season map(dynamic season) {
    try {
      return Season(
        number: season['number'],
        id: season['id'],
      );
    } catch (e) {
      throw Exception("Review SeasonMapper. Failed while mapping!");
    }
  }
}
