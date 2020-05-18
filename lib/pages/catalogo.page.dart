import 'package:famezapp/domain/product.model.dart';
import 'package:famezapp/pages/catalogo.components/product.card.dart';
import 'package:famezapp/utils/platform.scaffold.dart';
import 'package:flutter/widgets.dart';

class CatalogoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => PlatformScaffold(
    title: Text('Catálogo'),
    body: ListView(
      padding: EdgeInsets.all(8.0),
      children: this._mapProductsToCards(),
    )
  );

  final List<Product> _products = [
    Product(name: 'LOC'),
    Product(name: 'Pasta')
  ];

  List<Widget> _mapProductsToCards() => this._products.map(
    (product) => ProductCard(product)
  ).toList();

}