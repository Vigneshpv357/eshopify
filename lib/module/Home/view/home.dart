import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../webservices/cart_provider.dart';
import 'cart_details.dart';
import 'category.dart';
import 'home_view.dart';
import 'package:badges/badges.dart' as badges;
class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({super.key});

  @override
  State<HomeMainScreen> createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  int currentPageIndex = 0;

  late SharedPreferences _sharedPrefs;
  late String username ;
  @override
  void initState() {
    initial();
    // TODO: implement initState
    super.initState();
  }
  void initial() async
  {
    _sharedPrefs = await SharedPreferences.getInstance();
    setState(() {
      username = _sharedPrefs.getString("username")!;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[800],
        title: Text("E Shopify"),
        actions: [
          Consumer<CartProvider>(
            builder: (context, cartProvider, child) {
              return badges.Badge(
                position: badges.BadgePosition.bottomEnd(
                    bottom: 1, end: 1),
                badgeContent: Text(
                  cartProvider.cartCount.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                child: IconButton(
                  color: Colors.white,
                  icon: const Icon(Icons.shopping_cart_outlined),
                  iconSize: 25,
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (BuildContext ctx) =>  CartDetails()));
                  },
                ),
              );
            },
          ),
        ],

      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.transparent,
        backgroundColor: Colors.yellow[800],
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.category,),
            icon: Icon(Icons.category_outlined),
            label: 'Categories',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.favorite),
            icon: Icon(Icons.favorite_border),
            label: 'Favourite',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.notification_add),
            icon: Icon(Icons.notification_add_outlined),
            label: 'Notification',
          ),
        ],
      ),
      body: <Widget>[
        Container(

          alignment: Alignment.center,
          child: HomeView(),
        ),
        Container(

          alignment: Alignment.center,
          child: CategoryPage()
        ),
        Container(
        
          alignment: Alignment.center,
          child: const Text('Page 3'),
        ),
        Container(

          alignment: Alignment.center,
          //child:
        ),
      ][currentPageIndex],
      drawer: Drawer(

        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.blueGrey),
                accountName: Text(
                  "Vignesh PV",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("vigneshpv@gmail.com"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color.fromARGB(205, 185, 285, 188),
                  child: Text(
                    "V",
                    style: TextStyle(fontSize: 30.0, color: Colors.white),
                  ), //Text
                ), //circleAvatar
              ), //UserAccountDrawerHeader
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_bag),
              title: const Text(' My Orders '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.help_center),
              title: const Text(' Help '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite_border),
              title: const Text(' Favourite '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text(' Edit Profile '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
