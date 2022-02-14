import 'package:flutter/material.dart';

class ImageUnavailable extends StatelessWidget {
  const ImageUnavailable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
         return const Image(
                        key: Key('image_unavailable'),
                        image: AssetImage('assets/images/unavailable-image.jpg'),
                      );
    }
  }