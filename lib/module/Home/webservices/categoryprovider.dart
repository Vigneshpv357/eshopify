import 'package:flutter/foundation.dart';
import '../models/products.dart';
import 'apiservices.dart';
class CategoryProvider with ChangeNotifier {
  List<Category> _cat = [];
  ApiService apiService=ApiService();
  List<Category> get cat => _cat;

  // Add a method to load products from JSON

  void loaddatacategory() async {
    var data=await apiService.fetchCategory();
    print("load data${data!.length}");

    _cat=data!.cast<Category>();
    notifyListeners();
    print("load data _products${_cat!.length}");
  }

}
