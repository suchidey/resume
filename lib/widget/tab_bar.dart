import 'package:flutter/material.dart';

import '../colors.dart';
import '../constants.dart';
import '../data/data.dart';
import '../misc/custom_theme.dart';
import '../misc/ui.dart';
import '../page/base_page.dart';

class AppTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      //color: color.primary,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.menu,
                color: theme.textColor,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
            SizedBox(width: 16),
            SizedBox(
              width: 32,
              height: 32,
              child: CircleAvatar(
                backgroundImage: AssetImage(data.avatar),
                backgroundColor: Colors.white,
              ),
            ),
            SizedBox(width: 16),
            Row(
              children: [
                ui.getH1(data.name),
                SizedBox(width: constant.i4),
                Container(
                  width: constant.i8,
                  height: constant.i8,
                  margin: EdgeInsets.only(top: constant.i8),
                  decoration: BoxDecoration(
                    color: theme.buttonColor,
                    shape: BoxShape.circle,
                  ),
                )
              ],
            ),
            Flexible(fit: FlexFit.tight, child: SizedBox()),
            ui.getIconButton(Icons.brightness_4, () => theme.toggleTheme()),
          ],
        ),
      ),
    );
  }
}
