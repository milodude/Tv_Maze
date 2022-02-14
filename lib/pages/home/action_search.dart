import 'package:flutter/material.dart';
import 'package:tv_maze/pages/search/search_show_page.dart';

class ActionSearch extends StatelessWidget {
  const ActionSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                      hoverColor: Colors.purple[400],
                      onPressed: () {
                        Navigator.pushNamed(
                            context, SearchShowPage.routeName);
                      },
                      color: Colors.white,
                      icon: const Icon(
                        Icons.search,
                        color: Colors.blueAccent,
                      )),
                );
  }
}