import 'package:flutter/material.dart';
import 'package:tv_maze/utils/constants.dart';
///Widget that needs to be display whenever there is no image to show
class ImageUnavailable extends StatelessWidget {
  ///Constructor
  const ImageUnavailable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
         return const Image(
                        key: Key('image_unavailable'),
                        image: AssetImage(Constants.imageUnavailablePath),
                      );
    }
  }