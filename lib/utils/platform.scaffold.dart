import 'package:famezapp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'platform.widget.dart';

class PlatformScaffold extends PlatformWidget<Scaffold, CupertinoPageScaffold>  {
  final Widget title;
  final Widget body;

  PlatformScaffold({
    this.title,
    this.body
  });

  @override
  Scaffold createAndroidWidget(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: this.title,
    ),
    body: this.body,
  );

  @override
  CupertinoPageScaffold createIosWidget(BuildContext context) => CupertinoPageScaffold(
    navigationBar: CupertinoNavigationBar(
      middle: this.title,
      backgroundColor: FamezColors.primaryColor
    ),
    child: this.body,
  );
}