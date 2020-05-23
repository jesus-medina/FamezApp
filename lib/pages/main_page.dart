import 'package:famezapp/utils/platform_main_scaffold.dart';
import 'package:famezapp/viewmodels/products_list_viewmodel.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'states/android_scaffold_state.dart';
import 'states/ios_scaffold_state.dart';

class MainPage extends StatelessWidget {
  final String title = 'FamezApp';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (_) => ProductListViewModel(),
    child: PlatformMainScaffold(
      createAndroidWidget(),
      createIosWidget()
    )
  );

  AndroidScaffoldState createAndroidWidget() => AndroidScaffoldState();

  IosScaffoldState createIosWidget() => IosScaffoldState();

}