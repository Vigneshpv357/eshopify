import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import '../models/buynow_model.dart';
import '../models/products.dart';

class BuynowProvider extends ChangeNotifier {
  final List<BuyItem> _buyItems = [];

  List<BuyItem> get buyItems => _buyItems;

  void addToBuy(Products product, int quantity, String selectedVariant) {
    var existingBuyItem = _buyItems.firstWhereOrNull(
          (item) => item.product.id == product.id,
    );

    if (existingBuyItem != null) {
      existingBuyItem.quantity += quantity;
    } else {
      _buyItems.add(BuyItem(product: product, quantity: quantity));
    }

    notifyListeners();
  }

  int getProductQuantity(int productId) {
    int quantity = 0;
    for (BuyItem item in _buyItems) {
      if (item.product.id == productId) {
        quantity += item.quantity;
      }
    }
    return quantity;
  }

  int get buyCount {
    return _buyItems.fold(0, (sum, item) => sum + item.quantity);
  }

  double get totalPrice {
    return _buyItems.fold(
        0.0, (sum, item) => sum + (item.product.price! * item.quantity));
  }

  void updateBuyItemQuantity(int index, int newQuantity) {
    if (index >= 0 && index < _buyItems.length) {
      _buyItems[index].quantity = newQuantity;
      notifyListeners();
    }
  }

  void increaseBuyItemQuantity(int index) {
    if (index >= 0 && index < _buyItems.length) {
      _buyItems[index].quantity++;
      notifyListeners();
    }
  }

  void decreaseBuyItemQuantity(int index) {
    if (index >= 0 && index < _buyItems.length) {
      if (_buyItems[index].quantity > 1) {
        _buyItems[index].quantity--;
        notifyListeners();
      } else {

        _buyItems.removeAt(index);
        notifyListeners();
      }
    }
  }

  void removeBuyItem(int index) {
    if (index >= 0 && index < _buyItems.length) {
      _buyItems.removeAt(index);
      notifyListeners();
    }
  }

  void clearBuy() {
    _buyItems.clear();
    notifyListeners();
  }

  List<BuyItem> getBuyItemsList() {
    return List<BuyItem>.from(_buyItems);
  }
}
