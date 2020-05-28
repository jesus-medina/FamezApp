import 'package:famezapp/utils/platform/platform_statefull_widget.dart';
import 'package:famezapp/viewmodels/products_list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:famezapp/routes.dart';
import 'package:provider/provider.dart';

class AndroidMainScaffoldState extends State<PlatformStatefullWidget> {

  List<SimplePage> simplePages;

  int currentTabIndex = 0;

  ProductListViewModel vm;

  onTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    simplePages = getAppPages()
      ..removeAt(0);
    vm = Provider.of<ProductListViewModel>(context);
    vm.fetchProducts();

    return Scaffold(
      appBar: AppBar(
        title: Text('FamezApp'),
      ),
      body: simplePages[currentTabIndex].widgetBuilder(context),
      bottomNavigationBar: BottomNavigationBar(
        items: _simplePagesToListTiles(context),
        currentIndex: currentTabIndex,
        onTap: onTapped,
      ),
    );
  }

  List<BottomNavigationBarItem> _simplePagesToListTiles(BuildContext context) => simplePages.map(
    (SimplePage page) => BottomNavigationBarItem(
      title: Text(page.name),
      icon: Icon(page.iconData),
    )
  ).toList();
}