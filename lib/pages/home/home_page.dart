import 'package:flutter/material.dart';
import 'package:tv_maze/pages/home/action_search.dart';
import 'package:tv_maze/pages/home/shows.dart';
import 'package:tv_maze/utils/constants.dart';

///Home page or landing page
class HomePage extends StatefulWidget {
  ///constructor that takes a title a parameter
  const HomePage({Key? key, required this.title})
      : super(key: key);
  ///Title that will hold the Home Page
  final String title;
  ///Route name of the home page
  static const String routeName = Constants.homePageRouteName;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            actions: const <Widget>[
              ActionSearch(),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: const <Widget>[
                    Text(
                      'Shows',
                      style: TextStyle(fontSize: 24,fontWeight:FontWeight.bold),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Shows()
            ],
          )),
    );
  }
}
