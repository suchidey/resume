import 'package:flutter/material.dart';

Constants constant = Constants();

class Constants {
  get padding8 => 8;
  var padding18 = 18.0;
  var padding32 = 48.0;
  var padding48 = 48.0;
  var padding54 = 54.0;
  get padding100 => 100;
  get padding120 => 120;

  get margin12 => 12;

  var d108 = 108.0;
  get i4 => 4;
  get i8 => 8;
  get i6 => 6;
  get i12 => 12;
  get i32 => 32;
  get i128 => 128;

  var minTabletSize = 1080;

  var paddingSymmetric = EdgeInsets.symmetric();
  var paddingAll32 = EdgeInsets.symmetric();
  var paddingAll12 = EdgeInsets.symmetric();
  var paddingAll6 = EdgeInsets.symmetric();
  var paddingAll4 = EdgeInsets.symmetric();
  var paddingAllButton = EdgeInsets.symmetric();
  var paddingAll18 = EdgeInsets.symmetric();
  Constants() {
    paddingSymmetric = EdgeInsets.symmetric(
      vertical: padding32,
      horizontal: padding54,
    );
    paddingAll32 = EdgeInsets.all(32);
    paddingAll18 = EdgeInsets.all(18);
    paddingAll12 = EdgeInsets.all(12);
    paddingAll6 = EdgeInsets.all(6);
    paddingAll4 = EdgeInsets.all(4);
    paddingAllButton = EdgeInsets.fromLTRB(12, 2, 12, 2);
  }

  get iconSmall => 16;
  get iconMedium => 32;
  get iconLarge => 48;
  get iconXLarge => 64;
  double get radius2 => 2;
  double get radius6 => 6;
  double get radius12 => 12;
  double get buttonRadius => 32.0;
  double get cardRadius => 18.0;

  get elevation12 => 12;
  get elevation4 => 4;

  get f8 => 8;
  get f12 => 12;
  get f14 => 14;
  get f16 => 16;
  get f24 => 24;

  get i24 => 24;

  get i180 => 180;

  get cellHeight => 84;
  get cellHeaderHeight => 32;

  get border1 => 1;
  get border2 => 2;
  get border5 => 5;
}
