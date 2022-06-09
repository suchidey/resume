import 'package:flutter/material.dart';

import '../misc/custom_theme.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  CustomAppBar({required this.title}) : super();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        IconButton(
          icon: const Icon(Icons.brightness_4),
          onPressed: () => theme.toggleTheme(),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
