import 'package:famezapp/domain/product.model.dart';
import 'package:famezapp/utils/platform.widget.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class ProductCard extends PlatformWidget {

  final Product _product;

  ProductCard(this._product);

  @override
  Widget createAndroidWidget(BuildContext context) {
      // TODO: implement createAndroidWidget
      throw UnimplementedError();
    }
  
  @override
  Widget createIosWidget(BuildContext context) => Text(this._product.name);

}