import 'package:flutter/cupertino.dart';

class Product {
  String name;
  String description;
  String urlImage;
  String urlCatalogPage;
  String urlPictoStory;
  String urlVideoStory;
  int availability;
  double price;

  Product({
    @required this.name,
    @required this.description,
    @required this.urlImage,
    @required this.urlCatalogPage,
    @required this.urlPictoStory,
    @required this.urlVideoStory,
    @required this.availability,
    @required this.price
  });

  Map<String, dynamic> toMap() => {
    'name': name,
    'description': description,
    'urlImage': urlImage,
    'urlCatalogPage': urlCatalogPage,
    'urlPictoStory': urlPictoStory,
    'urlVideoStory': urlVideoStory,
    'availability': availability,
    'price': price,
  };
}

List<Product> getProducts() => [
  Product(
      name: 'Cal Mag D Advanced',
      description: '!CUIDATE AHORA, VIVE SALUDABLE MAÑANA¡',
      urlImage: 'https://www.amway.com.mx/img_pict/170_Catalog/Products/medium/170_110609.jpg',
      urlCatalogPage: 'https://amway.com.mx/downloads/misc/CalmagD_Catalogo.pdf',
      urlPictoStory: 'https://amway.com.mx/downloads/misc/CalmagD_Picto.pdf',
      urlVideoStory: 'https://www.youtube.com/watch?v=OAGazBa4dSM&feature=emb_title',
      availability: 0,
      price: 396.99),
  Product(
      name: 'Xs',
      description: '¡LA ENERGÍA XSTRA QUE NECESITAS!',
      urlImage: 'https://www.amway.com.co/img_pict/190_Catalog/Products/full/190_251184.jpg',
      urlCatalogPage: 'https://amway.com.mx/downloads/misc/XS_Catalogo.pdf',
      urlPictoStory: 'https://amway.com.mx/downloads/misc/XS_Picto.pdf',
      urlVideoStory: 'https://www.youtube.com/watch?v=th-5Nzn2fN0',
      availability: 0,
      price: 47.25),
  Product(
      name: 'B Plus',
      description: '¡EL LADO BUENO DE LA VIDA!',
      urlImage: 'https://www.amway.com.mx/img_pict/170_Catalog/Products/medium/170_110170.jpg',
      urlCatalogPage: 'https://amway.com.mx/downloads/misc/B-Plus-HojaCatMx.pdf',
      urlPictoStory: 'https://amway.com.mx/downloads/misc/Picto_BPlusmx.pdf',
      urlVideoStory: 'https://www.youtube.com/watch?v=vTQCX0P5GOg',
      availability: 0,
      price: 362.00),
  Product(
      name: 'Omega 3 Plus',
      description: '¡OH-MEGA INTERESANTE!',
      urlImage: 'https://www.amway.com.mx/img_pict/170_Catalog/Products/medium/170_122173.jpg',
      urlCatalogPage: 'https://amway.com.mx/downloads/misc/Omega3_Hoja_Catalogo_Mx.pdf',
      urlPictoStory: 'https://amway.com.mx/downloads/misc/Picto_Omega3_Plus_Mx.pdf',
      urlVideoStory: 'https://www.youtube.com/watch?v=YHzysXb5rxQ',
      availability: 0,
      price: 256.90),
  Product(
      name: 'LOC Multiusos',
      description: 'LOC, EL LIMPIADOR MÁS VERSATIL DEL MUNDO',
      urlImage: 'https://www.amway.com.mx/img_pict/170_Catalog/Products/medium/170_0001.jpg',
      urlCatalogPage: 'http://amway.com.mx/downloads/misc/LOC_Infografia.jpg',
      urlPictoStory: 'http://amway.com.mx/downloads/misc/LOC_PICTOGRAFIA.JPG',
      urlVideoStory: 'https://www.youtube.com/watch?v=p0-6KmAPess',
      availability: 0,
      price: 232.00),
  Product(
      name: 'Pasta dental Glister',
      description: '¡6 BENEFICIOS, 1 PASTA DENTAL!',
      urlImage: 'https://www.amway.com.mx/img_pict/170_Catalog/Products/medium/170_1959.jpg',
      urlCatalogPage: 'http://amway.com.mx/downloads/misc/GLISTER_INFOGRAFIA.pdf',
      urlPictoStory: 'https://www.amway.com.mx/downloads/misc/AmwayMex_Glister_Pictografia.pdf',
      urlVideoStory: 'https://www.youtube.com/watch?v=qb5Z3-91jlo&feature=emb_title',
      availability: 0,
      price: 130.00),
  Product(
      name: 'Toallitas desmaquillantes',
      description: '¡DESMAQUÍLLATE DELICADAMENTE, EN UN SOLO PASO!',
      urlImage: 'https://www.amway.com.mx/img_pict/170_Catalog/Products/medium/170_261750.jpg',
      urlCatalogPage: 'http://amway.com.mx/downloads/misc/TOALLITAS_INFOGRAFIA.pdf',
      urlPictoStory: 'http://amway.com.mx/downloads/misc/TOALLITAS_PICTOHISTORIA.JPG',
      urlVideoStory: 'https://www.youtube.com/watch?v=zBB_746j5gk&feature=emb_title',
      availability: 0,
      price: 204.99),
];