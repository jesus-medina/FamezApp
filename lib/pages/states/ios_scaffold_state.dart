import 'package:famezapp/utils/colors.dart';
import 'package:famezapp/utils/platform_statefull_widget.dart';
import 'package:famezapp/viewmodels/products_list_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:famezapp/routes.dart';
import 'package:provider/provider.dart';

class IosScaffoldState extends State<PlatformStatefullWidget> {
  List<SimplePage> simplePages;

  ProductListViewModel vm;

  @override
  Widget build(BuildContext context) {
    simplePages = getAppPages()
      ..removeAt(0);
    vm = Provider.of<ProductListViewModel>(context);
    vm.fetchProducts();

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: _simplePagesToTabBarItems(),
      ),
      tabBuilder: _tabBuilder,
    );
  }

  List<BottomNavigationBarItem> _simplePagesToTabBarItems() => simplePages.map(
    (SimplePage page) => BottomNavigationBarItem(
        icon: Icon(page.iconData),
        title: Text(page.name)
      )
  ).toList();

  Widget _tabBuilder(BuildContext context, int index) => CupertinoPageScaffold(
    navigationBar: CupertinoNavigationBar(
      backgroundColor: FamezColors.primaryColor,
      middle: Text('FamezApp'),
    ),
    child: simplePages[index].widgetBuilder(context),
  );
}
