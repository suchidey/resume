import 'package:flutter/material.dart';

import '../colors.dart';
import '../constants.dart';

CustomTheme theme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = false;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
        primaryColor: color.orange,
        scaffoldBackgroundColor: Color.fromARGB(255, 209, 209, 209),
        fontFamily: 'Montserrat',
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(constant.cardRadius)),
          buttonColor: color.lightOrange,
        ));
  }

  static ThemeData get darkTheme {
    return ThemeData(
        primaryColor: color.black,
        scaffoldBackgroundColor: color.darkGrey,
        fontFamily: 'Montserrat',
        textTheme: ThemeData.dark().textTheme,
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(constant.buttonRadius)),
          buttonColor: color.lightOrange,
        ));
  }

  get primaryColor => _isDarkTheme ? color.black : color.white;
  get secondaryColor => _isDarkTheme ? color.darkGrey : color.white;
  get tertiaryColor => _isDarkTheme ? color.darkGrey : color.lightgrey;
  get buttonColor => _isDarkTheme ? color.orange : color.orange;
  get textColor => _isDarkTheme ? color.white : color.black;
  get cellColor => _isDarkTheme ? color.darkGrey : color.lightgrey;

  TextStyle getStyleH8i() => TextStyle(color: theme.textColor, fontWeight: FontWeight.w100, fontStyle: FontStyle.italic, fontSize: constant.f12);
}
