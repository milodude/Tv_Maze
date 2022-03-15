import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tv_maze/pages/search/search_show_page.dart';

///Widget to be used to show a small icon in the AppBar to go to the search page
class ActionSearch extends StatelessWidget {
  ///Constructor
  const ActionSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: IconButton(
        hoverColor: Colors.purple[400],
        onPressed: () {
          Modular.to.pushNamed(SearchShowPage.routeName);
        },
        color: Colors.white,
        icon: const Icon(
          Icons.search,
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}
