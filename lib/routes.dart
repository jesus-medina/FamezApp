import 'package:flutter/widgets.dart';
import 'package:famezapp/pages/catalogo_page.dart';

Map<String, WidgetBuilder> getAppRoutes() => {
  '/' : _widgetBuilderWith(CatalogoPage()),
};

WidgetBuilder _widgetBuilderWith(Widget page) =>
  (BuildContext context) => page;