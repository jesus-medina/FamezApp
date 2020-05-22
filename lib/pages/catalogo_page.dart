import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:famezapp/domain/product_model.dart';
import 'package:famezapp/pages/catalogo.components/product_card.dart';
import 'package:famezapp/utils/platform_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class CatalogoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CatalogoPageState();
}

class _CatalogoPageState extends State<CatalogoPage> {
  List<Product> products = [];

  @override
  Widget build(BuildContext context) {
    _initProductsFromFirestore();
    return Scaffold(
        body: ListView(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          children: this._mapProductsToCards(context),
        )
    );
  }

  void _initProductsFromFirestore() {
    Future<QuerySnapshot> productsDocuments = Firestore.instance.collection('products').orderBy('price').getDocuments();
    productsDocuments.then(_loadRemoteProducts)
    .catchError(_onFirestoreError);
  }

  void _onFirestoreError(dynamic error) {
    setState(_loadLocalProducts);
  }

  void _loadLocalProducts() {
    this.products = getProducts();
    _sortProductsByPrice();
  }

  void _loadRemoteProducts(QuerySnapshot querySnapshot) {
    products.clear();
    querySnapshot.documents.asMap().forEach((key, DocumentSnapshot documentSnapshot) {
      Map<String, dynamic> documentData = documentSnapshot.data;

      Product existentProduct = Product(
        name: documentData['name'],
        description: documentData['description'],
        urlImage: documentData['urlImage'],
        urlCatalogPage: documentData['urlCatalogPage'],
        urlPictoStory: documentData['urlPictoStory'],
        urlVideoStory: documentData['urlVideoStory'],
        availability: documentData['availability'],
        price: documentData['price'],
      );

      products.add(existentProduct);
    });
    setState(() {});
  }

  void _sortProductsByPrice() {
    this.products.sort((a, b) => a.price.compareTo(b.price));
  }

  List<Widget> _mapProductsToCards(BuildContext context) =>
    products.map(
            (product) =>
            ProductCard(product, (productPressed) {
              _handleClickMe(context, productPressed);
            })
    ).toList();

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