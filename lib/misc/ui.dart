import 'dart:convert';
import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:custom_rich_text/custom_rich_text.dart';
import 'package:custom_rich_text/models/read_more_less_model.dart';
import 'package:cv/widget/download_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/src/lottie_builder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../constants.dart';
import '../widget/menu_button.dart';
import 'custom_theme.dart';

UI ui = UI();

class UI {
  Widget getMenuIconText(String title, IconData icon, {VoidCallback? onTap}) {
    return MenuButton(
      onTap: onTap,
      child: Padding(
        padding: constant.paddingAll12,
        child: Row(
          children: <Widget>[ui.getIcon(icon, constant.iconSmall), SizedBox(width: constant.i8), ui.getH7(title)],
        ),
      ),
    );
  }

  Widget getWorkIconText(String title, {IconData? icon, VoidCallback? onTap, bool animate = true}) {
    if (onTap == null) {
      return Padding(
        padding: constant.paddingAllLink,
        child: Row(
          children: <Widget>[
            if (icon != null) ui.getIcon(icon, constant.iconSmall, color: theme.textColor),
            if (icon != null) SizedBox(width: constant.i8),
            ui.getH9(title),
            SizedBox(width: constant.i8),
          ],
        ),
      );
    } else {
      return SizedBox(
        height: constant.d48, // <-- match_parent
        child: TextButton(
          style: TextButton.styleFrom(
            primary: theme.textColor,
            onSurface: theme.primaryColor,
          ),
          onPressed: onTap,
          child: Row(
            children: <Widget>[
              if (icon != null) ui.getIcon(icon, constant.iconSmall, color: theme.textColor),
              if (icon != null) SizedBox(width: constant.i8),
              ui.getH9b(title),
              SizedBox(width: constant.i8),
            ],
          ),
        ),
      );
    }
  }

  Widget getAppIconText(String title, IconData icon, {VoidCallback? onTap}) {
    return MenuButton(
        onTap: onTap,
        child: Padding(
          padding: constant.paddingAll6,
          child: Row(
            children: <Widget>[
              ui.getIcon(icon, constant.iconSmall, color: theme.textColor),
              SizedBox(width: constant.i8),
              ui.getH9i(title),
              SizedBox(width: constant.i8),
            ],
          ),
        ));
  }

  Widget getButton(IconData iconData, String text, Function() callback) {
    return ElevatedButton.icon(
      icon: Icon(iconData),
      onPressed: callback,
      label: ui.getH7(text),
      style: ElevatedButton.styleFrom(
        primary: theme.buttonColor,
        fixedSize: const Size(208, 43),
      ),
    );
  }

  Widget getIconTextButton(IconData iconData, String text, Function() callback) {
    return ui.getCard(
        Padding(
          padding: constant.paddingAll6,
          child: DownloadButton(
            onTap: callback,
            child: Padding(
              padding: constant.paddingAll4,
              child: Row(
                children: <Widget>[
                  ui.getIcon(iconData, constant.iconSmall),
                  SizedBox(width: constant.i8),
                  ui.getH9i(text),
                  SizedBox(width: constant.i8),
                ],
              ),
            ),
          ),
        ),
        borderRadius: constant.buttonRadius);
  }

  Widget getIconButton(IconData iconData, Function() callback) {
    return Container(
        width: constant.i32,
        height: constant.i32,
        margin: EdgeInsets.only(right: constant.margin12),
        child: FloatingActionButton(
          onPressed: () {
            callback();
          },
          elevation: constant.elevation4,
          backgroundColor: theme.secondaryColor,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [ui.getIcon(iconData, constant.iconSmall)]),
        ));
  }

  Icon getIcon(IconData icon, double size, {Color? color}) {
    if (color == null) color = theme.buttonColor;
    return Icon(icon, color: color, size: size);
  }

  Widget getCard(Widget child, {double borderRadius = 12, Color? color, int elevation = 0}) {
    return Card(
        color: color == null ? theme.primaryColor : color,
        elevation: elevation == 0 ? constant.elevation12 : elevation,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
        child: child);
  }

  Widget getAvatar(String image) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: theme.cellColor, width: constant.border5),
        shape: BoxShape.circle,
      ),
      child: CircleAvatar(
        backgroundImage: AssetImage(image),
        backgroundColor: theme.tertiaryColor,
        radius: 50,
      ),
    );
  }

  Widget getFancyIcon() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
        child: Container(
          width: 50.0,
          height: 50.0,
          child: Icon(
            Icons.search_rounded,
            color: Colors.white,
          ),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            border: Border.all(
              color: Colors.white,
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget getImageRectangle(String image, {double size = 48.0, double radius = 0}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius == 0 ? constant.radius12 : radius),
      child: Container(
        width: size,
        height: size,
        child: Image(image: AssetImage(image)),
        decoration: BoxDecoration(
          //color: theme.tertiaryColor,
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          //border: Border.all(
          //color: theme.primaryColor,
          //width: 5.0,
          //),
        ),
      ),
    );
  }

  Widget getNetworkImage(String url) {
    return Image.network(
      url,
      fit: BoxFit.fill,
      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
          ),
        );
      },
    );
  }

  Image getImagenBase64(String imageBase64, {int size = 0}) {
    const Base64Codec base64 = Base64Codec();
    var bytes = base64.decode(imageBase64);
    return Image.memory(
      bytes,
      width: size == 0 ? constant.iconSmall : size,
      fit: BoxFit.fitWidth,
    );
  }

  Widget getText(
    String text,
    FontWeight fontWeight,
    double fontSize, [
    FontStyle fontStyle = FontStyle.normal,
    int maxLines = 3,
    TextAlign textAlign = TextAlign.start,
  ]) {
    return AutoSizeText(
      text,
      textAlign: textAlign,
      style: TextStyle(
        //color: theme.textColor,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        fontSize: fontSize,
      ),
      minFontSize: constant.f8,
      maxLines: maxLines,
    );
    /*return FittedBox(
      fit: BoxFit.fitWidth,
      child: Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
          //color: theme.textColor,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          fontSize: fontSize,
        ),
      ),
    );*/
  }

  Widget getH1(String text) {
    return this.getText(text, FontWeight.bold, constant.f24);
  }

  Widget getH7(String text) {
    return this.getText(text, FontWeight.w100, constant.f16);
  }

  Widget getH7200(String text) {
    return this.getText(text, FontWeight.w200, constant.f16);
  }

  Widget getH7i(String text) {
    return this.getText(text, FontWeight.w100, constant.f16, FontStyle.italic);
  }

  Widget getH8i(String text, [int maxLines = 3]) {
    return this.getText(text, FontWeight.w100, constant.f14, FontStyle.italic, maxLines = maxLines);
  }

  Widget getH9i(String text, [int maxLines = 3]) {
    return this.getText(text, FontWeight.w100, constant.f12, FontStyle.italic, maxLines = maxLines, TextAlign.center);
  }

  getH9b(String text, [int maxLines = 3]) {
    return this.getText(text, FontWeight.w900, constant.f12, FontStyle.normal, maxLines = maxLines, TextAlign.center);
  }

  getH9(String text, [int maxLines = 3]) {
    return this.getText(text, FontWeight.w100, constant.f12, FontStyle.normal, maxLines = maxLines, TextAlign.left);
  }

  getH9bChip(String text) {
    return getCard(
        Padding(
          padding: constant.paddingAll12,
          child: ui.getH9b(text),
        ),
        color: theme.secondaryColor,
        elevation: constant.elevation4);
  }

  getChip(String text, {String image = ""}) {
    return Chip(
      elevation: constant.elevation12,
      padding: EdgeInsets.all(constant.i8),
      backgroundColor: theme.buttonColor,
      label: ui.getH9b(text),
    );
  }

/*
  Widget getLink(String text) {
    return LinkifyText(
      text,
      linkStyle: TextStyle(
          //color: theme.textColor,
          fontWeight: FontWeight.w100,
          fontStyle: FontStyle.italic,
          fontSize: constant.f12,
          color: theme.primaryColor),
      linkTypes: [LinkType.url],
      onTap: (link) {
        if (link.value != null) launch(link.value!);
      },
    );
  }
*/
  Widget getRichText(String text, {String highlightTerm = "", String highlightUri = ""}) {
    return CustomRichText(
      text: text,
      caseSensitive: false,
      readMoreLessModel: ReadMoreLessModel(
        trimLines: 2,
        readMoreText: ' read more',
        readLessText: ' read less',
        readMoreLessStyle: TextStyle(
          fontWeight: FontWeight.w800,
          fontStyle: FontStyle.italic,
          fontSize: constant.f16,
        ),
      ),
      textStyle: theme.getStyleH8i(),
      linkStyle: TextStyle(
          //color: theme.textColor,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
          fontSize: constant.f12),
      highlightTermsStyle: TextStyle(
          //color: theme.textColor,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontSize: constant.f12),
      onWebLinkTap: (web) async {
        await launch(web);
      },
      onPhoneTap: (phone) async {
        await launch('tel:$phone');
      },
      onEmailTap: (email) async {
        await launch('mailto:$email');
      },
      highlightTerms: [highlightTerm],
      onTermTap: (text) async {
        await launch(highlightUri);
      },
    );
  }

  showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.white,
        content: Text(
          '$message has been clicked',
          style: TextStyle(
            //color: theme.textColor,
            fontWeight: FontWeight.w100,
            fontStyle: FontStyle.italic,
            fontSize: constant.f12,
          ),
        ),
      ),
    );
  }

  double getHeight(BuildContext context) => MediaQuery.of(context).size.height;
  double getWidth(BuildContext context) => MediaQuery.of(context).size.width;

  getIframe(String url) {
    Container(
        child: WebView(
      initialUrl: Uri.dataFromString(url, mimeType: 'text/html').toString(),
      javascriptMode: JavascriptMode.unrestricted,
    ));
  }

  container(Widget child, double width, double height) {
    return Container(width: width, height: height, child: child);
  }
}
