import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../misc/custom_theme.dart';

class TextLink extends StatefulWidget {
  TextLink();

  @override
  _TextLinkState createState() => _TextLinkState();
}

class _TextLinkState extends State<TextLink> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: theme.getStyleH8i(),
        children: [
          const TextSpan(
            text: 'The last book bought is ',
          ),
          WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: InkWell(
                  onTap: () => _launchUrl('https://url-to-launch.com'),
                  child: Text('this',
                      style: theme
                          .getStyleH8i()
                          .merge(const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold))))),
        ],
      ),
    );
  }

  _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
