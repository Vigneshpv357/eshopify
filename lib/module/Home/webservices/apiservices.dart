import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/RespMain.dart';
import '../models/products.dart';
class ApiService{
  Future<List<Products>?> fetchProducts() async {
    var response = await http.get(Uri.parse("https://dummyjson.com/products"));
    print("api called");
    if (response.statusCode == 200) {
      var jsondata=jsonDecode(response.body.toString());
      var data=RespMain.fromJson(jsondata);
      var products=data.products;
      return products;
    } else {
      throw Exception();
    }
  }

  Future<List<Products>?> fetchCategory() async {
    var response = await http.get(Uri.parse("https://dummyjson.com/products/categories"));
    print("api called");
    if (response.statusCode == 200) {
      var jsondata=jsonDecode(response.body.toString());
      var data=RespMain.fromJson(jsondata);
      var products=data.products;
      return products;
    } else {
      throw Exception();
    }
  }




}