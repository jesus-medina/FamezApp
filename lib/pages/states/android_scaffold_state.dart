import 'package:famezapp/utils/platform_statefull_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:famezapp/utils/colors.dart';
import 'package:famezapp/routes.dart';

class AndroidScaffoldState extends State<PlatformStatefullWidget> {

  List<SimplePage> simplePages;

  int currentTabIndex = 0;

  onTapped(int index) {
    Navigator.of(context).pop();
    setState(() {
      currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    simplePages = getAppPages()
      ..removeAt(0);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          simplePages[currentTabIndex].name
        ),
      ),
      body: simplePages[currentTabIndex].widgetBuilder(context),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: _drawers(context),
        )
      ),
    );
  }

  List<Widget> _drawers(BuildContext context) {
    List<Widget> drawerHeader = [
      DrawerHeader(
          child: Text('FamezApp',
            style: TextStyle(
              fontSize: 28.0
            ),
          ),
          decoration: BoxDecoration(
            color: FamezColors.primaryColor
          ),
        )
    ];
    List<ListTile> drawerTiles = _simplePagesToListTiles(context);
    return List.from(drawerHeader)..addAll(drawerTiles);
  }

  List<ListTile> _simplePagesToListTiles(BuildContext context) => simplePages.map(
    (SimplePage page) => ListTile(
      title: Text(page.name),
      leading: Icon(page.iconData),
      selected: currentTabIndex == page.index,
      onTap: () {
        onTapped(page.index);
      },
    )
  ).toList();
}