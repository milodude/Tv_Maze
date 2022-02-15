import 'package:tv_maze/models/season.dart';
///Mapper for a season
class SeasonMapper {
  ///Method that maps a dynamic season, tipycally a json body that contains a dynamic season into a Season object
  static Season map(dynamic season) {
    try {
      return Season(
        number: season['number'],
        id: season['id'],
      );
    } catch (e) {
      throw Exception('Review SeasonMapper. Failed while mapping!');
    }
  }
}
