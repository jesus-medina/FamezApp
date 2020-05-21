import 'package:famezapp/domain/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart' show NumberFormat;

class ProductCard extends StatelessWidget {
  final Product _product;
  final Function _onTileTap;

  final numberFormat = NumberFormat("###.00", "en_US");

  ProductCard(this._product, this._onTileTap);

  @override
  Widget build(BuildContext context) => Card(
          child: Column(children: <Widget>[
        ListTile(
          leading: _renderImage(),
          title: Text(_product.name),
          subtitle: Text(_product.description),
          onTap: () {
            _onTileTap(_product);
          },
        ),
        _renderBottomRow()
      ]));

  Widget _renderImage() => Image.network(
        _product.urlImage,
      );

  Widget _renderBottomRow() => Padding(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Disponible: ${_product.availability}'),
            Text('\$ ${numberFormat.format(_product.price)}', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
          ]),
      padding: EdgeInsets.all(8.0));
}
