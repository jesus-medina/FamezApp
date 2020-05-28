import 'package:famezapp/domain/order_model.dart';

class FirebaseOrderToDomainOrderMapper {
  Order map(String documentID, Map<String, dynamic> firebaseOrder) => Order(
    documentID,
    arrivedDate: firebaseOrder['arrived_date'],
    requestedDate: firebaseOrder['requested_date'],
    productQuantity: firebaseOrder['product_quantity']
  );
}