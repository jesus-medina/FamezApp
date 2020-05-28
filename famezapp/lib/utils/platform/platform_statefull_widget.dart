
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

abstract class PlatformStatefullWidget<A extends State, I extends State> extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    try {
      if (Platform.isAndroid) {
        return createAndroidWidget();
      } else if (Platform.isIOS) {
        return createIosWidget();
      }
    } catch (e) {
      return createAndroidWidget();
    }
    // platform not supported returns an empty widget
    return createAndroidWidget();
  }

  I createIosWidget();

  A createAndroidWidget();

}