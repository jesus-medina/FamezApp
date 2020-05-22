import 'package:famezapp/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:famezapp/pages/contacto_page.dart';
import 'package:famezapp/pages/catalogo_page.dart';

class SimplePage {
  final int index;
  final String path;
  final String name;
  final WidgetBuilder widgetBuilder;
  final IconData iconData;

  const SimplePage({
    this.index,
    this.path,
    this.name,
    this.widgetBuilder,
    this.iconData
  });
}

List<SimplePage> getAppPages() => [
  SimplePage(
    path: '/',
    name: 'Main',
    widgetBuilder: _widgetBuilderWith(MainPage()),
    iconData: Icons.home
  ),
  SimplePage(
    index: 0,
    path: 'catalogo',
    name: 'Catálogo',
    widgetBuilder: _widgetBuilderWith(CatalogoPage()),
    iconData: Icons.book
  ),
  SimplePage(
    index: 1,
    path: 'contacto',
    name: 'Contacto',
    widgetBuilder: _widgetBuilderWith(ContactoPage()),
    iconData: Icons.phone_android
  ),
];

Map<String, WidgetBuilder> getAppRoutes() => Map.fromIterable(
  getAppPages(),
  key: (route) => route.path,
  value: (route) => route.widgetBuilder
);

WidgetBuilder _widgetBuilderWith(Widget page) =>
  (BuildContext context) => page;