import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';
import '../data/data.dart';
import '../widget/navigation.dart';
import '../widget/tab_bar.dart';
import 'about_page.dart';
import 'education_page.dart';
import 'expertise_page.dart';
import 'extra_page.dart';
import 'work_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void _downloadCV() {
    launch(data.CV_URL);
  }

  void _hireMe() {
    scrollToIndex(keys.length - 1);
  }

  Widget pagePadding([Key? key]) => SizedBox(
        key: key,
        height: constant.padding18,
      );

  final keys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  Widget _buildListDetail(bool forTablet) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 30),
          Visibility(visible: !forTablet, child: AppTabBar()),
          AboutPage(keys[0]),
          EducationPage(keys[1]),
          WorkPage(keys[2]),
          ExtraPage(keys[3]),
          ExpertisePage(keys[4]),
          SizedBox(height: constant.padding120),
        ],
      ),
    );
  }

  void scrollToIndex(int index) {
    Scrollable.ensureVisible(
      keys[index].currentContext!,
      duration: Duration(milliseconds: 500),
    );
    if (_scaffoldKey.currentState!.isDrawerOpen) {
      Navigator.of(context).pop();
    }
  }

  Widget _buildNavigation(bool forTablet) {
    return Padding(
      padding: EdgeInsets.only(top: forTablet ? constant.padding32 : 0),
      child: Navigation((index) {
        scrollToIndex(index);
      }, _downloadCV),
    );
  }

  Widget _buildTabletBody(double width) {
    return Scaffold(
      key: _scaffoldKey,
      body: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildNavigation(true),
          SizedBox(width: 24),
          LimitedBox(
            maxWidth: 720,
            child: _buildListDetail(true),
          )
        ],
      ),
    );
  }

  Widget _buildPhoneBody() {
    return Scaffold(
      key: _scaffoldKey,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: constant.i4),
        child: _buildListDetail(false),
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.transparent,
        ),
        child: Drawer(
          child: _buildNavigation(false),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constrain) {
        return constrain.maxWidth >= constant.minTabletSize ? _buildTabletBody(constrain.maxWidth) : _buildPhoneBody();
      },
    );
  }
}
