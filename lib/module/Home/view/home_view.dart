import 'package:eshopify/module/Home/view/product_details.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.nonReactive(
      onViewModelReady: (model) {
        model.init(context);

      },
      onDispose: (model) {
      },
      builder: (context, viewModel, child) {
        viewModel.setdata(context);
        return Scaffold(

          body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Color(0xF7CB2D), Color(0xffffffff)])),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(

                    decoration: InputDecoration(
                      hintText: "Search for Products, Brands and More",
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.sort),),
                      border: OutlineInputBorder()
                    ),
                  ),
                ),

                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: MasonryGridView.builder(
                      gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      itemCount: viewModel.products!.length,
                      itemBuilder: (context, index) {
                        final product =  viewModel.products![index];
                        return InkWell(

                          onTap: (){
                            var productt = product.id;
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ProductDetailsView(productId: product.id as int, product: product, )),
                            );

                          },
                          child: Card(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,

                                children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.network(product.thumbnail as String),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(product.title as String,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),),
                                      ),

                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(

                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [

                                        Text("${product.discountPercentage} % off" as String,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14),),
                                        Text("€ ${product.price}" as String,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                                      ],
                                    ),
                                  ),
                                  Container(
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
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Free Delivery",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 11),),
                                  )

                                 ],
                              ),
                          ),

                        );
                            }
                        )

                  ),
                ),
              ],
            ),
          ),

        );
      },
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}


