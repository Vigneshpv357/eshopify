
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

import '../../models/buynow_model.dart';

import '../../webservices/buynow_provider.dart';

import 'buynow_list.dart';

class BuynowDetails extends StatefulWidget {
  const BuynowDetails({super.key});

  @override
  State<BuynowDetails> createState() => _BuynowDetailsState();
}

class _BuynowDetailsState extends State<BuynowDetails> {
  String currency = "₦";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.yellow[700],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 500,
                padding: const EdgeInsets.all(10),
                color: Colors.yellow[800],
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: Colors.white,
                            ),
                          ),
                          const Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Order Summary",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                          // Consumer<BuynowProvider>(
                          //   builder: (context, buyProvider, child) {
                          //     return badges.Badge(
                          //       position: badges.BadgePosition.bottomEnd(
                          //           bottom: 1, end: 1),
                          //       badgeContent: Text(
                          //         buyProvider.buyCount.toString(),
                          //         style: const TextStyle(
                          //           color: Colors.white,
                          //         ),
                          //       ),
                          //       child: IconButton(
                          //         color: Colors.white,
                          //         icon: const Icon(Icons.local_mall),
                          //         iconSize: 25,
                          //         onPressed: () {},
                          //       ),
                          //     );
                          //   },
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.only(
                    left: 16, right: 16, bottom: 80, top: 20),
                margin: const EdgeInsets.only(top: 70),
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  children: [
                    Expanded(
                      child: Consumer<BuynowProvider>(
                        builder: (context, buyProvider, child) {
                          final List<BuyItem> buyItems =
                              buyProvider.buyItems;

                          if (buyItems.isEmpty) {
                            Navigator.pop(context);
                          }

                          return ListView.builder(
                            itemCount: buyItems.length,
                            itemBuilder: (context, index) {
                              final buyItem = buyItems[index];
                              return Dismissible(
                                key: Key(buyItem.product.id.toString()), // Use a unique key for each item
                                background: Container(
                                  color: Colors.red,
                                  alignment: Alignment.centerRight,
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ),
                                direction: DismissDirection.endToStart,
                                onDismissed: (direction) {
                                  Provider.of<BuynowProvider>(context,
                                      listen: false)
                                      .removeBuyItem(index);
                                },
                                child: GestureDetector(
                                    onTap: () {},
                                    child: BuyListItem(
                                      buyItem: buyItem,
                                      index: index,
                                    )),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Consumer<BuynowProvider>(
                      builder: (context, buyProvider, child) {
                        return Container(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(child: Container()),
                                  // ElevatedButton(
                                  //   onPressed: () {
                                  //     Provider.of<BuynowProvider>(context,
                                  //         listen: false)
                                  //         .clearBuy();
                                  //   },
                                  //   style: ElevatedButton.styleFrom(
                                  //       backgroundColor:  Colors.yellow[800],
                                  //       shape: RoundedRectangleBorder(
                                  //         borderRadius:
                                  //         BorderRadius.circular(30),
                                  //       )),
                                  //   child: const Text(
                                  //     "Clear Cart",
                                  //     style: TextStyle(color: Colors.white),
                                  //   ),
                                  // ),
                                ],
                              ),
                              const Divider(
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Total Price:',
                                    style:
                                    Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Expanded(child: Container()),
                                  Text(
                                    '\$${buyProvider.totalPrice.toStringAsFixed(2)}',
                                    style:
                                    Theme.of(context).textTheme.titleLarge,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.yellow[800],
                                    elevation: 10,
                                  ),
                                  child: const Text('Place Order',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
