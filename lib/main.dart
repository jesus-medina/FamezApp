// import 'package:firebase/firebase.dart' as WebFirebase;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:famezapp/domain/product_model.dart';
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
    onGenerateRoute: (routeSettings) => MaterialPageRoute(
      builder: (BuildContext context) => CatalogoPage()
    ),
    title: 'Famez App',
    themeData: ThemeData(
      primaryColor: FamezColors.primaryColor
    ),
    cupertinoThemeData: CupertinoThemeData(
      primaryColor: FamezColors.primaryColor
    ),
  );
}