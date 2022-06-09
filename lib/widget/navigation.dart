import 'package:cv/misc/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';
import '../data/data.dart';
import '../misc/ui.dart';

class Navigation extends StatelessWidget {
  final Function onTap;
  final VoidCallback? downloadCV;

  Navigation(this.onTap, this.downloadCV);

  Widget _buildNavigation() {
    return ui.getCard(
      Padding(
        padding: constant.paddingAll32,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                SizedBox(
                  width: constant.i128,
                  height: constant.i128,
                  child: ui.getAvatar(data.avatar),
                ),
                ui.getIconButton(Icons.brightness_4, () => theme.toggleTheme())
              ]),
              SizedBox(height: constant.i24),
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
              SizedBox(height: constant.i4),
              ui.getH7200(data.profession),
              SizedBox(height: constant.i32),
              ui.getMenuIconText(data.about, Icons.account_circle, onTap: () {
                this.onTap(0);
              }),
              ui.getMenuIconText(data.education, Icons.school, onTap: () {
                this.onTap(1);
              }),
              ui.getMenuIconText(data.work, Icons.work, onTap: () {
                this.onTap(2);
              }),
              ui.getMenuIconText(data.extracurricular, Icons.snowboarding, onTap: () {
                this.onTap(3);
              }),
              ui.getMenuIconText(data.skill, Icons.android, onTap: () {
                this.onTap(4);
              }),
              SizedBox(height: constant.i32),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ui.getIconButton(FontAwesomeIcons.linkedinIn, () => {launch(data.linkedinUrl)}),
                  SizedBox(
                    width: 164,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ui.getIconTextButton(Icons.file_download, data.downloadCv, () => {launch(data.CV_URL)})
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: constant.i32),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildNavigation();
  }
}
