// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:famezapp/domain/product_model.dart';
import 'package:famezapp/pages/catalogo.components/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:intl/intl.dart' show NumberFormat;

void main() {
  final numberFormat = NumberFormat("###.00", "en_US");
  Product someProduct = Product(
    'someId',
    name: '',
    description: '',
    urlImage: 'https://i.picsum.photos/id/9/250/250.jpg',
    urlCatalogPage: '',
    urlPictoStory: '',
    urlVideoStory: '',
    price: 0.0
  );

  testWidgets('ProductCard should build a widget with expected product name', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      // Given
      String expectedName = 'some product name';
      someProduct.name = expectedName;
      ProductCard productCard = ProductCard(someProduct, () {});

      // When
      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: productCard
          )
      ));

      // Then
      expect(find.text(expectedName), findsOneWidget);
    });
  });

  testWidgets('ProductCard should build a widget with expected product description', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      // Given
      String expectedDescription = 'some product description';
      someProduct.description = expectedDescription;
      ProductCard productCard = ProductCard(someProduct, () {});

      // When
      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: productCard
          )
      ));

      // Then
      expect(find.text(expectedDescription), findsOneWidget);
    });
  });

  testWidgets('ProductCard should build a widget with Disponible: 10', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      // Given
      int expectedAvailability = 10;
      someProduct.availability = expectedAvailability;
      ProductCard productCard = ProductCard(someProduct, () {});

      // When
      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: productCard
          )
      ));

      // Then
      expect(find.text('Disponible: $expectedAvailability'), findsOneWidget);
    });
  });

  testWidgets('ProductCard should build a widget with \$ 100.00', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      // Given
      double expectedPrice = 100;
      someProduct.price = expectedPrice;
      ProductCard productCard = ProductCard(someProduct, () {});

      // When
      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
              body: productCard
          )
      ));

      // Then
      expect(find.text('\$ ${numberFormat.format(expectedPrice)}'), findsOneWidget);
    });
  });

//  testWidgets('ProductCard should build a image with expected product url', (WidgetTester tester) async {
//    provideMockedNetworkImages(() async {
//      // Given
//      String expectedImageUrl = 'https://i.picsum.photos/id/9/250/250.jpg';
//      Product someProduct = Product(name: '', description: '', urlImage: expectedImageUrl, availability: 0, price: 0);
//      ProductCard productCard = ProductCard(someProduct);

//      // When
//      await tester.pumpWidget(MaterialApp(
//          home: Scaffold(
//              body: productCard
//          )
//      ));

//      // Then it does not crash
//    });
//  });
}
