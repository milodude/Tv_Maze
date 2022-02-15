import 'package:flutter/material.dart';
import 'package:tv_maze/utils/constants.dart';

class BackFloatingActionButton extends StatelessWidget {
  const BackFloatingActionButton({
    Key? key, required this.action,
  }) : super(key: key);

  final Function action;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      key: const Key(Constants.backFloatingActionButtonKey),
      mini: true,
      child: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
      onPressed: (){
        action(context);
      } 
    );
  }
}
