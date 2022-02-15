import 'package:flutter/material.dart';
import 'package:tv_maze/utils/constants.dart';

class SearchNoResultsFound extends StatelessWidget {
  const SearchNoResultsFound({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SizedBox(
          height: 10,
        ),
        Text(
          Constants.showSearchNoReultsTitle,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(Constants.showSearchNoReultsSubtitle,
            style: TextStyle(
              fontSize: 16,
            )),
      ],
    );
  }
}
