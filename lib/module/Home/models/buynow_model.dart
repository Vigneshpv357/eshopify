import 'package:eshopify/module/Home/models/products.dart';

class BuyItem {
  final Products product;
  int quantity;

  BuyItem({required this.product, this.quantity = 1});

}
