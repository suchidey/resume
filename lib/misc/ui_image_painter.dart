import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class UiImagePainter extends CustomPainter {
  final ui.Image image;

  UiImagePainter(this.image);

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    // simple aspect fit for the image
    var hr = size.height / image.height;
    var wr = size.width / image.width;

    double ratio;
    double translateX;
    double translateY;
    if (hr < wr) {
      ratio = hr;
      translateX = (size.width - (ratio * image.width)) / 2;
      translateY = 0.0;
    } else {
      ratio = wr;
      translateX = 0.0;
      translateY = (size.height - (ratio * image.height)) / 2;
    }

    canvas.translate(translateX, translateY);
    canvas.scale(ratio, ratio);
    canvas.drawImage(image, new Offset(0.0, 0.0), new Paint());
  }

  @override
  bool shouldRepaint(UiImagePainter other) {
    return other.image != image;
  }
}

class UiImageDrawer extends StatelessWidget {
  final ui.Image image;

  const UiImageDrawer({required Key key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.infinite,
      painter: UiImagePainter(image),
    );
  }
}
