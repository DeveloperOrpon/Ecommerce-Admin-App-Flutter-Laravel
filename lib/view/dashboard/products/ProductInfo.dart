
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../config/refresh.dart';
import '../../../controller/productController.dart';
import '../../widget/productItem.dart';
import 'addProduct.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());
    return Container(
      decoration: BoxDecoration(color: Colors.grey.shade100),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SmartRefresher(
            physics: const BouncingScrollPhysics(),
            enablePullDown: true,
            enablePullUp: true,
            header: refreshLoading(context),
            footer: customFooter,
            controller: productController.refreshControllerCategory,
            onRefresh: productController.onRefreshProduct,
            onLoading: productController.onLoadingProduct,
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    Obx(() => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: productController.allProduct.value.map((element) => ProductItem(element)).toList(),
                    )),
                    SizedBox(height: 40,)
                  ]),
                )
              ],
            ),
          ),
          Positioned(
            right: 10,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: FloatingActionButton.extended(

                label: Text(
                  "+ Add",
                  style: TextStyle(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      fontSize: 14),
                ),
                onPressed: () {
                  Get.to(const AddProduct(), transition: Transition.fadeIn);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
