import 'package:famezapp/data/mappers/firebase_order_to_domain_order_mapper.dart';
import 'package:famezapp/data/mappers/firebase_product_to_domain_product_mapper.dart';
import 'package:famezapp/utils/platform/platform_statefull_widget.dart';
import 'package:famezapp/viewmodels/products_list_viewmodel.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'states/android_main_scaffold_state.dart';
import 'states/ios_main_scaffold_state.dart';

class MainPage extends StatelessWidget {
  final String title = 'FamezApp';

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (_) => ProductListViewModel(
      FirebaseProductToDomainProductMapper(),
      FirebaseOrderToDomainOrderMapper(),
    ),
    child: _PlatformMainScaffold(
      createAndroidWidget(),
      createIosWidget()
    )
  );

  AndroidMainScaffoldState createAndroidWidget() => AndroidMainScaffoldState();

  IosMainScaffoldState createIosWidget() => IosMainScaffoldState();

}

class _PlatformMainScaffold extends PlatformStatefullWidget<AndroidMainScaffoldState, IosMainScaffoldState>  {
  final AndroidMainScaffoldState androidMainScaffoldState;
  final IosMainScaffoldState iosMainScaffoldState;

  _PlatformMainScaffold(
    this.androidMainScaffoldState,
    this.iosMainScaffoldState
  );

  @override
  AndroidMainScaffoldState createAndroidWidget() => AndroidMainScaffoldState();

  @override
  IosMainScaffoldState createIosWidget() => IosMainScaffoldState();
}