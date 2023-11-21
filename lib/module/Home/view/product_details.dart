import 'package:carousel_slider/carousel_slider.dart';
import 'package:eshopify/module/Home/models/cart_model.dart';
import 'package:eshopify/module/Home/view/payment/buynow_details.dart';
import'package:flutter/material.dart';
import'package:provider/provider.dart';
import'package:http/http.dart' as http;
import 'dart:convert';
import '../models/products.dart';
import '../webservices/buynow_provider.dart';
import '../webservices/cart_provider.dart';

class ProductDetailsView extends StatefulWidget {
  final int productId;
  final Products product;

  const ProductDetailsView({Key? key, required

  this.productId, required this.product}) : super(key: key);

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  late Future<Products> _productFuture;

  @override
  void initState() {
    super.initState();
    _productFuture = _fetchProduct(widget.productId as int);
  }
  int _currentImageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final Products productId;
    return FutureBuilder<Products>(
      future: _productFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final product = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.yellow[800],
              title: Text(product.title as String),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CarouselSlider(
                          items: (product.images)?.map((imageUrl) => Image.network(imageUrl)).toList(),
                          options: CarouselOptions(
                            viewportFraction: 1.0,
                            enableInfiniteScroll: false,
                            pageSnapping: true,
                            onPageChanged: (index, reason) => setState(() => _currentImageIndex = index),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 10,right: 100),
                          child: Transform(
                            transform:
                            Matrix4.translationValues(_currentImageIndex * 20, 0, 0),
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                    const SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.only(left:8),
                      child: Text(product.title as String, style: TextStyle(fontSize: 26.0,fontWeight: FontWeight.w500)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:8),
                      child: Text('${product.brand}',style: TextStyle(fontSize: 17,color: Colors.grey[700])),
                    ),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.only(left:20),
                      child: Text(product.description as String,style: TextStyle(fontSize: 15),),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:8),
                          child: Text('${product.discountPercentage}% off',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.red[600])),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right:8),
                          child: Text('€${product.price}',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold,color: Colors.green[600])),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 75,
                        decoration: BoxDecoration(
                            color: Colors.green[700],
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Icon(Icons.star,color: Colors.white,size: 16,),
                            ),
                            Text("${product.rating}",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 120,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child:  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Stocks left: ${product.stock}",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Free Delivery",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 11),),
                    ),
                    const SizedBox(height: 40.0),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 300,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child:  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text("Category: ${product.category}",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black),)),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 60.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.yellow[900], // Background color
                            ),
                            onPressed: (){


                              Provider.of<CartProvider>(context, listen: false).addToCart(widget.product, 1, "");
                              print("Added successfully");
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [
                              Icon(Icons.shopping_cart_outlined),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text("ADD TO CART"),
                              )
                          ],
                        ),
                            )
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.yellow[800], // Background color
                            ),
                            onPressed: (){
                              Provider.of<BuynowProvider>(context, listen: false).addToBuy(widget.product, 1, "");
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const BuynowDetails()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                children: [
                                  Icon(Icons.electric_bolt_outlined),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text("BUY NOW"),
                                  )
                                ],
                              ),
                            )
                        ),
                      ],
                    )

                  ],
                ),
              ),
            ),
          );
        } else

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return

            const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Future<Products> _fetchProduct(int productId) async {
    final response = await http.get(
      Uri.parse('https://dummyjson.com/products/$productId'),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return Products.fromJson(data);
    } else {
      throw Exception('Failed to fetch product');
    }
  }
}