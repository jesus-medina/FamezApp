import 'package:famezapp/pages/catalogo.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'utils/colors.dart';
import 'utils/platform.app.dart';

void main() {
  runApp(FamezApp());
}

class FamezApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => PlatformApp(
    title: 'Famez App',
    themeData: ThemeData(
      primaryColor: FamezColors.primaryColor
    ),
    cupertinoThemeData: CupertinoThemeData(
      primaryColor: FamezColors.primaryColor
    ),
      home: CatalogoPage(),
    );
}