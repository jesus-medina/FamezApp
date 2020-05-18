import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform.widget.dart';

class PlatformApp extends PlatformWidget<MaterialApp, CupertinoApp> {
  final String title;
  final ThemeData themeData;
  final CupertinoThemeData cupertinoThemeData;
  final Widget home;

  PlatformApp({
    this.title,
    this.themeData,
    this.cupertinoThemeData,
    this.home
  });

  @override
  MaterialApp createAndroidWidget(BuildContext context) => MaterialApp(
    title: this.title,
    theme: this.themeData,
    home: this.home,
  );

  @override
  CupertinoApp createIosWidget(BuildContext context) => CupertinoApp(
    title: this.title,
    theme: this.cupertinoThemeData,
    home: this.home,
  );
}