// import 'dart:convert';
//GetX
//
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
//
//
// import '../models/product_model.dart';
//
// class UserController extends GetxController {
//
//
//   // The list of products.
//   RxList<ProductElement> products = <ProductElement>[].obs;
//
//   Future<void> getproducts() async {
//     var url = Uri.parse("https://dummyjson.com/products");
//     final response = await http.get(url);
//     if (response.statusCode == 200) {
//       var jsondata = json.decode(response.body.toString());
//
//       final data = jsondata['products'] as List<dynamic>;
//
//
//       final p = data.map((todoJson) => ProductElement.fromJson(todoJson))
//           .toList();
//
//       products.assignAll(p);
//       update();
//     } else {
//       throw Exception('Failed to load quotes');
//     }
//   }
//
// }
// //   Future<void> updateProduct(String id, String title, int price,
// //       String thumbnail, String description) async {
// //     // Create a request body.
// //     final body = {
// //       'title': title,
// //       'price': price.toString(),
// //       'thumbnail': "https://i.dummyjson.com/data/products/1/1.jpg",
// //       'description': description,
// //     };
// //
// //     // Make a PUT request to the API.
// //     final response = await http.put(
// //       Uri.parse('https://dummyjson.com/products/$id'),
// //       headers: <String, String>{
// //         'Content-Type': 'application/json',
// //       },
// //       body: json.encode(body),
// //     );
// //
// //     // Check the response status code.
// //     if (response.statusCode == 200) {
// //       // The product was updated successfully.
// //       print('Product updated successfully!');
// //       print("${response.body}");
// //
// //
// //       for(int i=0;i<products.length;i++){
// //         if(products[i].id==id){
// //           products[i].title=title;
// //           products[i].price=price;
// //           products[i].description=description;
// //           products[i].thumbnail=thumbnail;
// //           update();
// //
// //         }
// //
// //       }
// //     } else {
// //       // An error occurred while updating the product.
// //       print('Error updating product: ${response.statusCode}');
// //     }
// //   }
// // //
// // // updateProducts(String title,num price,String dis,int id) async {
// // //   //getx update api data
// // //   // var token =
// // //   print("update called");
// // //   //     'YOUR_TOKEN';
// // //   try {
// // //     var body = {
// // //       'title': title,
// // //       'price': price,
// // //       'description': dis,
// // //       'id': id,
// // //     };
// // //
// // //     http.Response response = await http.put(
// // //       Uri.parse('https://dummyjson.com/products/$id'),
// // //       body: jsonEncode(body),
// // //       headers: {
// // //         'Content-Type': 'application/json',
// // //         'Accept': 'application/json',
// // //        // 'Authorization': 'Bearer $token'
// // //       },
// // //     );
// // //
// // //     if (response.statusCode == 200) {
// // //       final json = jsonDecode(response.body);
// // //       print('data updated');
// // //       print(json);
// // //     } else {
// // //       print('response status code not 200');
// // //       throw jsonDecode(response.body)['meta']["message"] ??
// // //           "Unknown Error Occured";
// // //     }
// // //   } catch (e) {
// // //     print(e);
// // //   }
// // // }
// //
