import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Order {
  String key;
  Timestamp arrivedDate;
  Timestamp requestedDate;
  int productQuantity;

  Order(
    this.key, {
    @required this.arrivedDate,
    @required this.requestedDate,
    @required this.productQuantity
  });

  Map<String, dynamic> toMap() => {
    'arrived_date': arrivedDate,
    'requested_date': requestedDate,
    'product_quantity': productQuantity
  };
}

List<Order> getXsOrders() => [
  Order(
    '2020-05-25T11:11:11',
    arrivedDate: Timestamp.fromMillisecondsSinceEpoch(1590430271),
    requestedDate: Timestamp.fromMillisecondsSinceEpoch(1590430271),
    productQuantity: 20
  ),
  Order(
    '2020-05-25T11:11:11',
    arrivedDate: Timestamp.fromMillisecondsSinceEpoch(1590430271),
    requestedDate: Timestamp.fromMillisecondsSinceEpoch(1590430271),
    productQuantity: 4
  ),
];