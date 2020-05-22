import 'package:famezapp/pages/states/android_scaffold_state.dart';
import 'package:famezapp/pages/states/ios_scaffold_state.dart';
import 'package:famezapp/utils/platform_statefull_widget.dart';

class PlatformMainScaffold extends PlatformStatefullWidget<AndroidScaffoldState, IosScaffoldState>  {
  final AndroidScaffoldState androidScaffoldState;
  final IosScaffoldState iosScaffoldState;

  PlatformMainScaffold(
    this.androidScaffoldState,
    this.iosScaffoldState
  );

  @override
  AndroidScaffoldState createAndroidWidget() => AndroidScaffoldState();

  @override
  IosScaffoldState createIosWidget() => IosScaffoldState();
}