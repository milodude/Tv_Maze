import 'package:flutter_test/flutter_test.dart';
import 'package:tv_maze/utils/constants.dart';

void main() {
  testWidgets(
      'Constants: bloc error message should display "Something went wrong!" ',
      (tester) async {
    expect(Constants.blocErrorText, 'Something went wrong!');
  });

  testWidgets(
      'Constants: bloc error when loading message should display "Error while loading " ',
      (tester) async {
    expect(Constants.blocErrorWhileLoadingText, 'Error while loading ');
  });

    testWidgets(
      'Constants: grid_view_card_Key message should display "grid_view_card_Key" ',
      (tester) async {
    expect(Constants.gridViewCardKey, 'grid_view_card_Key');
  });

   testWidgets(
      'Constants: Expanded_show_grid_view_key message should display "Expanded_show_grid_view_key" ',
      (tester) async {
    expect(Constants.gridViewExpandedKey, 'Expanded_show_grid_view_key');
  });

  
   testWidgets(
      'Constants: grid_view_tile_Key message should display "grid_view_tile_Key" ',
      (tester) async {
    expect(Constants.gridViewTileKey, 'grid_view_tile_Key');
  });

  testWidgets(
      'Constants: grid_view_inkwell_Key message should display "grid_view_inkwell_Key" ',
      (tester) async {
    expect(Constants.gridViewInkwellKey, 'grid_view_inkwell_Key');
  });

    testWidgets(
      'Constants: imageSizeMedium message should contain "medium" ',
      (tester) async {
    expect(Constants.imageSizeMedium, 'medium');
  });

     testWidgets(
      'Constants: imageSizeOriginal message should contain "original" ',
      (tester) async {
    expect(Constants.imageSizeOriginal, 'original');
  });

  testWidgets(
      'Constants: when image is not available message should contain path to assets folder ',
      (tester) async {
    expect(Constants.imageUnavailablePath, 'assets/images/unavailable-image.jpg');
  });

   testWidgets(
      'Constants: show status is ended value should be "Ended"',
      (tester) async {
    expect(Constants.showStatusEnded, 'Ended');
  });

   testWidgets(
      'Constants: show status field is to be determined value should be "To Be Determined"',
      (tester) async {
    expect(Constants.showStatusToBeDetermined, 'To Be Determined');
  });

   testWidgets(
      'Constants: show scheduled days field is requested should return "days"',
      (tester) async {
    expect(Constants.showScheduleDays, 'days');
  });

     testWidgets(
      'Constants: show scheduled time field is requested should return "time"',
      (tester) async {
    expect(Constants.showScheduleTime, 'time');
  });
}
