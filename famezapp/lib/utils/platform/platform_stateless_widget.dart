
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

abstract class PlatformStalessWidget<A extends Widget, I extends Widget> extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    try {
      if (Platform.isAndroid) {
        return createAndroidWidget(context);
      } else if (Platform.isIOS) {
        return createIosWidget(context);
      }
    } catch (e) {
      return createAndroidWidget(context);
    }
    // platform not supported returns an empty widget
    return createAndroidWidget(context);
  }

  I createIosWidget(BuildContext context);

  A createAndroidWidget(BuildContext context);

}