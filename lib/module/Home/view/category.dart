import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';
class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
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
            child: Row(
              children: [

                Expanded(
                  child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: MasonryGridView.builder(
                          gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                          itemCount: viewModel.products!.length,
                          itemBuilder: (context, index) {
                            final product =  viewModel.products![index];
                            return Card(child: Text("${product.category as String}"));
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
