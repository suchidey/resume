import 'package:cv/constants.dart';
import 'package:cv/misc/custom_theme.dart';
import 'package:flutter/material.dart';

import '../misc/ui.dart';

class PageTitle extends StatelessWidget {
  final String title;

  PageTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ui.getH1(title),
        SizedBox(height: constant.i12),
        Container(
          width: constant.i32,
          height: constant.elevation4,
          decoration: BoxDecoration(
            color: theme.buttonColor,
            borderRadius: BorderRadius.circular(constant.radius6),
          ),
        )
      ],
    );
  }
}
