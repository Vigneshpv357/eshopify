import 'package:eshopify/module/Home/models/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import '../models/products.dart';
import '../webservices/productprovider.dart';

class HomeViewModel extends BaseViewModel {
  var provider;
  init(BuildContext context){
    print("init provider");
    provider = Provider.of<ProductProvider>(context);
    fetch(context);
  }

  List<Products> _products = [];

  List<Products> get products => _products;


  fetch(BuildContext context)  {
    print("try to call api");
    provider.loaddata();
  }

  Future<void> setdata(BuildContext context) async {
    var s=provider.products;
    print("p length${s.length}");
    _products=await provider.products;
    notifyListeners();
    print("_p length${_products.length}");
  }
}
