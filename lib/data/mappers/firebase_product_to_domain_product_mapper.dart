import 'package:famezapp/domain/product_model.dart';

class FirebaseProductToDomainProductMapper {
  Product map(String documentID, Map<String, dynamic> firebaseProduct) => Product(
    documentID,
    name: firebaseProduct['name'],
    description: firebaseProduct['description'],
    urlImage: firebaseProduct['urlImage'],
    urlCatalogPage: firebaseProduct['urlCatalogPage'],
    urlPictoStory: firebaseProduct['urlPictoStory'],
    urlVideoStory: firebaseProduct['urlVideoStory'],
    price: firebaseProduct['price'].toDouble(),
  );
}