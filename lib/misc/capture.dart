import 'dart:math';

import 'package:flutter/material.dart';

import 'over_paint_boundary.dart';

class Capturer extends StatelessWidget {
  static final Random random = Random();

  final GlobalKey<OverRepaintBoundaryState> overRepaintKey;

  const Capturer({required Key key, required this.overRepaintKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: OverRepaintBoundary(
        key: overRepaintKey,
        child: RepaintBoundary(
          child: Column(
            children: List.generate(
              30,
              (i) => Container(
                color: Color.fromRGBO(random.nextInt(256), random.nextInt(256), random.nextInt(256), 1.0),
                height: 100,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
