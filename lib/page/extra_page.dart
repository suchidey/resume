import 'package:cv/data/expertise.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';
import '../data/data.dart';
import '../data/extra.dart';
import '../misc/custom_theme.dart';
import '../misc/ui.dart';
import '../widget/page_title.dart';
import 'base_page.dart';

class ExtraPage extends StatefulWidget {
  ExtraPage(GlobalKey key) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return ExtraPageState();
  }
}

class ExtraPageState extends State<ExtraPage> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: Padding(
        padding: constant.paddingSymmetric,
        child: LayoutBuilder(
          builder: (_, constrain) {
            return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
              PageTitle(data.extracurricular),
              ...allExtra.all().expand((value) => [
                    SizedBox(height: constant.padding18),
                    SizedBox(height: 4.0),
                    ui.getH7(value.title),
                    ...value.section.expand(((element) => {
                          Row(children: [
                            SizedBox(height: constant.padding8),
                            if (element.url != null)
                              ui.getWorkIconText("- ${element.text}", icon: null, onTap: () => {launch(element.url!)})
                            else
                              ui.getWorkIconText("- ${element.text}", icon: null, onTap: () => {}, animate: false), //ui.getH9i("- ${element.text}"),
                            if (element.link != null) ui.getWorkIconText("", icon: Icons.download, onTap: () => {launch(element.link!)}),
                          ]),
                          if (element.app != null)
                            Row(
                              children: [
                                SizedBox(width: constant.padding8),
                                ui.getImageRectangle(element.app!.image, size: constant.iconSmall, radius: constant.radius6),
                                SizedBox(width: constant.padding8),
                                if (element.app?.url != null) ui.getWorkIconText(element.app!.name, onTap: () => {launch(element.app!.url)}) else ui.getH9b(element.app!.name),
                                SizedBox(width: constant.padding8),
                                if (element.app!.googleplay.length > 0)
                                  Material(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(constant.radius6),
                                      ),
                                      color: theme.primaryColor,
                                      child: Row(children: [
                                        ui.getAppIconText(data.googlePlay, FontAwesomeIcons.googlePlay, onTap: () {
                                          launch(element.app!.googleplay);
                                        }),
                                      ])),
                                SizedBox(width: constant.padding8),
                                if (element.app!.appstore.length > 0)
                                  Material(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(constant.radius6),
                                      ),
                                      color: theme.primaryColor,
                                      child: Row(children: [
                                        ui.getAppIconText(data.iosAppstore, FontAwesomeIcons.appStore, onTap: () {
                                          launch(element.app!.appstore);
                                        }),
                                      ]))
                              ],
                            )
                        })),
                    SizedBox(height: 4.0),
                  ]),
            ]);
          },
        ),
      ),
    );
  }
}
