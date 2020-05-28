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
    this._firebaseProductToDomainProductMapper =
        firebaseProductToDomainProductMapper;
    this._firebaseOrderToDomainOrderMapper = firebaseOrderToDomainOrderMapper;
  }

  Future<void> fetchProducts() async {
    if (products.length == 0) {
      _fetchProductsFromFirestore();
    }
  }

  void _fetchProductsFromFirestore() {
    Firestore.instance
        .collection('products')
        .orderBy('price')
        .snapshots()
        .listen(_loadRemoteProducts)
        .onError(_onFirestoreErrorFetchingProduct);
  }

  void _loadRemoteProducts(QuerySnapshot querySnapshot) {
    print('Loaded from firestore');
    querySnapshot.documentChanges.forEach(_onFirebaseProductChange);
  }

  void _onFirebaseProductChange(DocumentChange productDocumentChange) {
    DocumentSnapshot documentSnapshot = productDocumentChange.document;
    Map<String, dynamic> firebaseProduct = documentSnapshot.data;
    String documentID = documentSnapshot.documentID;
    _addOrReplaceExistentProductDocument(documentID, firebaseProduct);
  }

  void _addOrReplaceExistentProductDocument(
      String documentID, Map<String, dynamic> firebaseProduct) {
    Product firestoreProduct = _firebaseProductToDomainProductMapper.map(documentID, firebaseProduct);

    int index = products.indexWhere((product) => product.key == firestoreProduct.key);
    _addOrReplaceExistentProduct(index, firestoreProduct);
  }

  void _addOrReplaceExistentProduct(int index, Product product) {
    if (index == -1) {
      products.add(product);
      _fetchOrdersFromFirebase(product);
    } else
      products.replaceRange(index, index + 1, [product]);
    notifyListeners();
  }

  void _fetchOrdersFromFirebase(Product product) {
    Firestore.instance
        .collection('products')
        .document(product.key)
        .collection('orders')
        .orderBy('arrived_date')
        .snapshots()
        .listen((QuerySnapshot querySnapshot) {
      _loadRemoteOrders(querySnapshot, product);
    }).onError((error) {
      print(error);
    });
  }

  void _loadRemoteOrders(QuerySnapshot querySnapshot, Product product) {
    querySnapshot.documentChanges.forEach((DocumentChange orderDocumentChange) {
      _onFirebaseOrderChange(orderDocumentChange, product);
    });
  }

  void _onFirebaseOrderChange(
      DocumentChange orderDocumentChange, Product product) {
    DocumentSnapshot documentSnapshot = orderDocumentChange.document;
    Map<String, dynamic> firebaseOrder = documentSnapshot.data;
    String documentID = documentSnapshot.documentID;
    _addOrReplaceExistentOrderDocument(
        documentID, firebaseOrder, product);
  }

  void _addOrReplaceExistentOrderDocument(String documentID,
      Map<String, dynamic> firebaseOrder, Product product) {
    Order firestoreOrder = _firebaseOrderToDomainOrderMapper.map(documentID, firebaseOrder);

    int index = product.orders.indexWhere((order) => order.key == firestoreOrder.key);
    _addOrReplaceExistentOrder(index, product, firestoreOrder);
  }

  void _addOrReplaceExistentOrder(int index, Product product, Order order) {
    if (index == -1)
      product.orders.add(order);
    else
      product.orders.replaceRange(index, index + 1, [order]);
    notifyListeners();
  }

  void _onFirestoreErrorFetchingProduct(dynamic error) {
    print('Loaded from locale because some error');
    print(error);
    products.clear();
    products = getProducts()..sortBy('price');
    notifyListeners();
  }
}

extension ProductListSort on List<Product> {
  void sortBy(String attribute) {
    this.sort((a, b) => a.toMap()[attribute].compareTo(b.toMap()[attribute]));
  }
}
