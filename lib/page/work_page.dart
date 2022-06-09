import 'package:cv/colors.dart';
import 'package:cv/data/expertise.dart';
import 'package:cv/data/work.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:steps/steps.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';
import '../data/data.dart';
import '../misc/custom_theme.dart';
import '../misc/ui.dart';
import '../widget/page_title.dart';
import 'base_page.dart';

class WorkPage extends StatefulWidget {
  WorkPage(GlobalKey key) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return WorkPageState();
  }
}

class WorkPageState extends State<WorkPage> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;

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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[PageTitle(data.work), SizedBox(height: constant.padding18), body()],
            );
          },
        ),
      ),
    );
  }

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical ? stepperType = StepperType.horizontal : stepperType = StepperType.vertical);
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  body() {
    return SizedBox(
      height: 1550,
      child: Container(
        alignment: Alignment.topCenter,
        child: Steps(
          direction: Axis.vertical,
          size: 10.0,
          path: {'color': theme.buttonColor, 'width': 3.0},
          steps: getSteps(),
        ),
      ),
    );
  }

  getSteps() {
    return allWork.all().asMap().entries.map((entry) {
      int idx = entry.key + 1;
      Work work = entry.value;

      return {
        'color': color.white,
        'background': theme.buttonColor,
        'label': '', //'•',
        'content': Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ui.getCard(ui.getImageRectangle(work.images[0]), elevation: constant.elevation4),
                SizedBox(width: constant.padding8),
                Material(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(constant.radius6),
                    ),
                    color: theme.tertiaryColor,
                    child: ui.getWorkIconText(work.name, onTap: () => {launch(work.url)})),
              ],
            ),
            SizedBox(height: constant.padding8),
            ...work.app.expand((value) => [
                  SizedBox(height: 4.0),
                  Row(
                    children: [
                      SizedBox(width: constant.padding8),
                      ui.getImageRectangle(value.image, size: constant.iconMedium, radius: constant.radius6),
                      SizedBox(width: constant.padding8),
                      ui.getH9(value.name),
                      SizedBox(width: constant.padding8),
                      if (value.googleplay.length > 0)
                        Material(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(constant.radius6),
                            ),
                            color: theme.primaryColor,
                            child: Row(children: [
                              //ui.container(Lottie.network('https://assets3.lottiefiles.com/packages/lf20_oabT72.json'), 128, 256),
                              ui.getAppIconText(data.googlePlay, FontAwesomeIcons.googlePlay, onTap: () {
                                launch(value.googleplay);
                              }),
                            ])),
                      SizedBox(width: constant.padding8),
                      if (value.appstore.length > 0)
                        Material(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(constant.radius6),
                            ),
                            color: theme.primaryColor,
                            child: Row(children: [
                              //ui.container(Lottie.network('https://assets8.lottiefiles.com/packages/lf20_4jkk6z.json'), 128, 256),
                              ui.getAppIconText(data.iosAppstore, FontAwesomeIcons.appStore, onTap: () {
                                launch(value.appstore);
                              }),
                            ])),
                    ],
                  ),
                  SizedBox(height: 4.0),
                ]),
            SizedBox(height: constant.padding8),
            ui.getH7(work.task),
            SizedBox(
              height: constant.padding8,
            ),
            ...work.list.expand((value) => [
                  SizedBox(
                    height: 4.0,
                  ),
                  ui.getH9(value),
                  SizedBox(
                    height: 4.0,
                  ),
                ]),
          ],
        )
      };
    }).toList();
  }
}
