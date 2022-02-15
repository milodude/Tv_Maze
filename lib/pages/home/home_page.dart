import 'package:flutter/material.dart';
import 'package:tv_maze/pages/home/action_search.dart';
import 'package:tv_maze/pages/home/shows.dart';
import 'package:tv_maze/services/show_service.dart';
import 'package:tv_maze/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title, required this.showService}) : super(key: key);
  final String title;
  static const routeName = Constants.homePageRouteName;
  final ShowService showService;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: const [
           ActionSearch(),
        ],
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: const [Text('Shows', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)],
            ),
          ),
          const SizedBox(height: 20,),
          Shows(showService: widget.showService,)
        ],
      )
    );
  }
}
