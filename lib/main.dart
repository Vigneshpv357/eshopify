import 'package:eshopify/module/Home/view/home_view.dart';
import 'package:eshopify/module/Home/webservices/buynow_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'module/Home/view/drawer.dart';
import 'module/Home/view/home.dart';
import 'module/Home/webservices/cart_provider.dart';
import 'module/Home/webservices/productprovider.dart';
import 'module/SplashScreen/splashScreen.dart';

const SAVE_KEY_NAME = 'UserLoggedIn';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
    ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => BuynowProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeMainScreen(),
      ),
    );

  }
}


