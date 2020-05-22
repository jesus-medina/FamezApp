import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:famezapp/domain/product_model.dart';

void resetProducts() {
  getProducts().forEach((p) {
    String documentName = p.name.toLowerCase().replaceAll(' ', '_');
    Firestore.instance.collection('products').document(documentName).setData(
      p.toMap()
    );
  });
}