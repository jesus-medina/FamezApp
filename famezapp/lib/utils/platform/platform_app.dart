import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform_stateless_widget.dart';

class PlatformApp extends PlatformStalessWidget<MaterialApp, CupertinoApp> {
  final String initialRoute;
  final Map<String, WidgetBuilder> routes;
  final RouteFactory onGenerateRoute;
  final String title;
  final ThemeData themeData;
  final CupertinoThemeData cupertinoThemeData;
  final Widget home;

  PlatformApp({
    this.initialRoute,
    this.routes = const <String, WidgetBuilder>{},
    this.onGenerateRoute,
    this.title,
    this.themeData,
    this.cupertinoThemeData,
    this.home
  });

  @override
  MaterialApp createAndroidWidget(BuildContext context) => MaterialApp(
    initialRoute: this.initialRoute,
    routes: this.routes,
    onGenerateRoute: this.onGenerateRoute,
    title: this.title,
    theme: this.themeData,
    home: this.home,
  );

  @override
  CupertinoApp createIosWidget(BuildContext context) => CupertinoApp(
    initialRoute: this.initialRoute,
    routes: this.routes,
    onGenerateRoute: this.onGenerateRoute,
    title: this.title,
    theme: this.cupertinoThemeData,
    home: this.home,
  );
}