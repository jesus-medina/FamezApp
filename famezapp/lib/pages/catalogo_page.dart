import 'package:famezapp/domain/product_model.dart';
import 'package:famezapp/pages/catalogo.components/product_card.dart';
import 'package:famezapp/viewmodels/products_list_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CatalogoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CatalogoPageState();
}

class _CatalogoPageState extends State<CatalogoPage> {
  ProductListViewModel vm;

  @override
  Widget build(BuildContext context) {
    vm = Provider.of<ProductListViewModel>(context);
    // _initProductsFromFirestore();
    return Scaffold(
        body: ListView(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          children: this._mapProductsToCards(context),
        )
    );
  }

  List<Widget> _mapProductsToCards(BuildContext context) =>
    vm.products.map((product) => ProductCard(product, (productPressed) {
      _handleClickMe(context, productPressed);
    })).toList();

  Future<void> _handleClickMe(BuildContext context, Product productPressed) async {
    return showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text(productPressed.name),
          message: Text(productPressed.description),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: Text('Hoja de catálogo'),
              onPressed: () {
                launchUrl(productPressed.urlCatalogPage);
              },
            ),
            CupertinoActionSheetAction(
              child: Text('Pictohistoria'),
              onPressed: () {
                launchUrl(productPressed.urlPictoStory);
              },
            ),
            CupertinoActionSheetAction(
              child: Text('Videohistoria'),
              onPressed: () {
                launchUrl(productPressed.urlVideoStory);
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            isDefaultAction: true,
            child: Text('Cancelar'),
            onPressed: () {
              Navigator.pop(context, 'Cancel');
            },
          ),
        );
      },
    );
  }

  void launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}