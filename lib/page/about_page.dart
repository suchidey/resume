import 'package:flutter/material.dart';

import '../constants.dart';
import '../data/data.dart';
import '../misc/ui.dart';
import '../widget/page_title.dart';
import 'base_page.dart';

class AboutPage extends StatelessWidget {
  AboutPage(GlobalKey key) : super(key: key);

  Widget _multiChildLayout({
    required bool forTablet,
    required List<Widget> children,
  }) {
    Widget result;
    if (!forTablet) {
      result = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: children,
      );
    } else {
      result = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      );
    }
    return result;
  }

  bool _isTabletSize(double maxWidth) {
    return maxWidth > 4 * constant.d108;
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: Padding(
        padding: constant.paddingSymmetric,
        child: LayoutBuilder(
          builder: (_, constrain) {
            final maxWidth = constrain.maxWidth;
            final isTabletSize = _isTabletSize(maxWidth);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                PageTitle(data.aboutMe),
                SizedBox(height: constant.padding18),
                _multiChildLayout(
                  forTablet: isTabletSize,
                  children: <Widget>[
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ui.getH8i(data.intro, 5),
                        ],
                      ),
                    )
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}