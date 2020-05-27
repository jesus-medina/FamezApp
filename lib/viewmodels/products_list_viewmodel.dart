import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:famezapp/data/mappers/firebase_order_to_domain_order_mapper.dart';
import 'package:famezapp/data/mappers/firebase_product_to_domain_product_mapper.dart';
import 'package:famezapp/domain/order_model.dart';
import 'package:famezapp/domain/product_model.dart';
import 'package:flutter/material.dart';

class ProductListViewModel extends ChangeNotifier {
  FirebaseProductToDomainProductMapper _firebaseProductToDomainProductMapper;
  FirebaseOrderToDomainOrderMapper _firebaseOrderToDomainOrderMapper;
  List<Product> products = [];

  ProductListViewModel(
    FirebaseProductToDomainProductMapper firebaseProductToDomainProductMapper,
    FirebaseOrderToDomainOrderMapper firebaseOrderToDomainOrderMapper) {
    this._firebaseProductToDomainProductMapper = firebaseProductToDomainProductMapper;
    this._firebaseOrderToDomainOrderMapper = firebaseOrderToDomainOrderMapper;
  }

  Future<void> fetchProducts() async {
    if (products.length == 0) {
      _initProductsFromFirestore();
    }
  }

  void _initProductsFromFirestore() {
    Firestore.instance.collection('products')
      .orderBy('price')
      .snapshots()
      .listen(_loadRemoteProducts)
      .onError(_onFirestoreError);
  }

  void _loadRemoteProducts(QuerySnapshot querySnapshot) {
    print('Loaded from firestore');
    querySnapshot.documentChanges.forEach(_onFirebaseProductChange);
  }

  void _onFirebaseProductChange(DocumentChange documentChange) {
    DocumentSnapshot documentSnapshot = documentChange.document;
    Map<String, dynamic> firebaseProduct = documentSnapshot.data;
    String documentID = documentSnapshot.documentID;
    _addOrReplaceExistentProductDocument(documentID, firebaseProduct);
  }

  void _addOrReplaceExistentProductDocument(String documentID, Map<String, dynamic> firebaseProduct) {
    Product existentProduct = _firebaseProductToDomainProductMapper
      .map(documentID, firebaseProduct);

    int index = products.indexWhere((product) => product.key == existentProduct.key);
    _addOrReplaceExistentProduct(index, existentProduct);
  }

  void _addOrReplaceExistentProduct(int index, Product existentProduct) {
    if (index == -1) {
      products.add(existentProduct);

      Firestore.instance.collection('products')
        .document(existentProduct.key)
        .collection('orders')
        .orderBy('arrived_date')
        .snapshots()
        .listen((QuerySnapshot querySnapshot) {
          querySnapshot.documentChanges.forEach((DocumentChange documentChange) {
            DocumentSnapshot documentSnapshot = documentChange.document;
            Map<String, dynamic> firebaseOrder = documentSnapshot.data;
            String documentID = documentSnapshot.documentID;

            Order existentOrder = _firebaseOrderToDomainOrderMapper.map(documentID, firebaseOrder);

            int index = existentProduct.orders.indexWhere((order) => order.key == existentOrder.key);
            if (index == -1) existentProduct.orders.add(existentOrder);
            else existentProduct.orders.replaceRange(index, index + 1, [existentOrder]);
            notifyListeners();
          });
        })
        .onError((error) {
          print(error);
        });
    }
    else products.replaceRange(index, index + 1, [existentProduct]);
    notifyListeners();
  }

  void _onFirestoreError(dynamic error) {
    print('Loaded from locale because some error');
    print(error);
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