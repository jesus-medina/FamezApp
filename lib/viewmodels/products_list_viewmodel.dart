import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:famezapp/domain/product_model.dart';
import 'package:flutter/material.dart';

class ProductListViewModel extends ChangeNotifier {
  List<Product> products = [];

  Future<void> fetchProducts() async {
    if (products.length == 0) {
      _initProductsFromFirestore();
    }
  }

  void _initProductsFromFirestore() {
    Firestore.instance.collection('products')
      .orderBy('price')
      .getDocuments()
      .then(_loadRemoteProducts)
      .catchError(_onFirestoreError);
  }

  void _loadRemoteProducts(QuerySnapshot querySnapshot) {
    print('Loaded from firestore');
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
    notifyListeners();
  }

  void _onFirestoreError(dynamic error) {
    print('Loaded from locale because some error');
    products.clear();
    products = getProducts()..sortBy('price');
    notifyListeners();
  }
}

extension ProductListSort on List<Product> {
  void sortBy(String attribute) {
    this.sort((a, b) =>
      a.toMap()[attribute].compareTo(
        b.toMap()[attribute]
      ));
  }
}