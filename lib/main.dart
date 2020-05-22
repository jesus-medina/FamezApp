// import 'package:firebase/firebase.dart' as WebFirebase;
import 'package:famezapp/pages/catalogo_page.dart';
import 'package:famezapp/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'utils/colors.dart';
import 'utils/platform_app.dart';

void main() {
  runApp(FamezApp());
}

class FamezApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => PlatformApp(
    initialRoute: '/',
    routes: getAppRoutes(),
    title: 'Famez App',
    themeData: ThemeData(
      primaryColor: FamezColors.primaryColor
    ),
    cupertinoThemeData: CupertinoThemeData(
      primaryColor: FamezColors.primaryColor
    ),
  );
}