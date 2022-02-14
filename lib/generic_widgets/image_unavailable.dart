import 'package:flutter/material.dart';

class ImageUnavailable extends StatelessWidget {
  const ImageUnavailable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
         return const Image(
                        image: AssetImage('assets/images/unavailable-image.jpg'),
                      );
    }
  }