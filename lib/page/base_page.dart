import 'package:cv/constants.dart';
import 'package:flutter/material.dart';

import '../misc/ui.dart';

class BasePage extends StatelessWidget {
  final Color? color;
  final Widget child;

  BasePage({
    this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(margin: constant.paddingAll4, child: ui.getCard(child)));
  }
}
