import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:tv_maze/utils/constants.dart';

///Floating action button that represents going back in the application
class BackFloatingActionButton extends StatelessWidget {
  ///Constructor. Requires a function as a paremter in order to execute when pressed.
  const BackFloatingActionButton({
    Key? key,
    required this.action,
  }) : super(key: key);
  ///Parameter. Should be the action you want to execute when the button is pressed.
  final Function action;
  @override
  Widget build(BuildContext context) {
    return DraggableFab(
      child: FloatingActionButton(
          key: const Key(Constants.backFloatingActionButtonKey),
          mini: true,
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            action(context);
          }),
    );
  }
}
