import 'package:eshopify/module/Home/models/products.dart';

class CartItem {
  final Products product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});

}
