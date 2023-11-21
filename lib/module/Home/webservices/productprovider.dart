import 'package:flutter/foundation.dart';
import '../models/products.dart';
import 'apiservices.dart';
class ProductProvider with ChangeNotifier {
  List<Products> _products = [];
  ApiService apiService=ApiService();
  List<Products> get products => _products;

  // Add a method to load products from JSON
  void loaddata() async {
    var data=await apiService.fetchProducts();
    print("load data${data!.length}");

    _products=data!;
    notifyListeners();
    print("load data _products${_products!.length}");
  }




}
