import 'package:famezapp/utils/platform_main_scaffold.dart';
import 'package:flutter/widgets.dart';

import 'states/android_scaffold_state.dart';
import 'states/ios_scaffold_state.dart';

class MainPage extends StatelessWidget {
  final String title = 'FamezApp';

  @override
  Widget build(BuildContext context) => PlatformMainScaffold(
    createAndroidWidget(),
    createIosWidget()
  );

  AndroidScaffoldState createAndroidWidget() => AndroidScaffoldState();

  IosScaffoldState createIosWidget() => IosScaffoldState();

}