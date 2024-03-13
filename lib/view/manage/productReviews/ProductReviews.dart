import 'package:ashique_admin_app/controller/productController.dart';
import 'package:ashique_admin_app/view/manage/productReviews/review_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../config/refresh.dart';

class ProductReviews extends StatelessWidget {
  static const String routeName = 'ProductReviews';

  const ProductReviews({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    ProductController productController = Get.put(ProductController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
        // automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Product Reviews ',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
        // actions: [
        //   // IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.search))
        // ],
        // bottom: PreferredSize(
        //   preferredSize: Size.fromHeight(56),
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
        //     child: SearchBar(
        //       controller: searchController,
        //       elevation: MaterialStatePropertyAll(0),
        //       leading: const Icon(CupertinoIcons.search),
        //       hintText: 'Search Customer',
        //       textStyle:
        //           const MaterialStatePropertyAll(TextStyle(fontSize: 16)),
        //       hintStyle: const MaterialStatePropertyAll(
        //           TextStyle(color: Colors.grey, fontSize: 14)),
        //       shape: MaterialStatePropertyAll(RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(5))),
        //       backgroundColor: MaterialStatePropertyAll(Colors.grey.shade100),
        //       trailing: [
        //         IconButton(
        //           onPressed: searchController.clear,
        //           icon: Icon(Icons.clear),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Obx(() {
                return SmartRefresher(
                  physics: const BouncingScrollPhysics(),
                  enablePullDown: true,
                  enablePullUp: true,
                  header: refreshLoading(context),
                  footer: customFooter,
                  controller: productController.refreshControllerReview,
                  onRefresh: productController.onRefreshReview,
                  onLoading: productController.onLoadingReview,
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverList(
                          delegate: SliverChildBuilderDelegate(
                              (context, index) => ReviewTile(
                                    reviewModel: productController
                                        .allReviewProduct.value[index],
                                  ),
                              childCount:
                                  productController.allReviewProduct.length))
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
