import 'package:flutter_test/flutter_test.dart';
import 'package:tv_maze/models/episode.dart';

void main() {
  Episode episode = Episode(
      name: 'Pilot',
      number: 1,
      season: 1,
      summary: '<p>A <b>pilOT</b> wiTHIn a PiLOt</p>',
      image: {'medium:"a"'});

  testWidgets(
      'episode mapper formatSummary method: should format summary property and take all <b> tags out',
      (tester) async {
    var indexNotFound = episode.formatSummary().indexOf('<b>');
    expect(indexNotFound, -1);
  });

  testWidgets(
      'episode mapper formatSummary method: should format summary property and take all <p> tags out',
      (tester) async {
    var indexNotFound = episode.formatSummary().indexOf('<p>');
    expect(indexNotFound, -1);
  });

  testWidgets(
      'episode mapper formatSummary method: should format summary property and take all </b> tags out',
      (tester) async {
    var indexNotFound = episode.formatSummary().indexOf('</b>');
    expect(indexNotFound, -1);
  });

  testWidgets(
      'episode mapper formatSummary method: should format summary property and take all </p> tags out',
      (tester) async {
    var indexNotFound = episode.formatSummary().indexOf('</p>');
    expect(indexNotFound, -1);
  });
}
