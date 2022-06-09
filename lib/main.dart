import 'package:flutter/material.dart';

import 'data/data.dart';
import 'misc/custom_theme.dart';
import 'page/main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp() : super();
  //1
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State {
  @override
  void initState() {
    super.initState();
    theme.addListener(() {
      //2
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: data.website,
      home: MainPage(),
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: theme.currentTheme,
    );
  }
}
