import 'package:ashique_admin_app/view/widget/productItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/textStyle.dart';
import 'addProduct.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ListView(
          physics: BouncingScrollPhysics(),
          children: [
            ProductItem(),
            ProductItem(),
            ProductItem(),
            ProductItem(),
            ProductItem(),
            ProductItem(),
            ProductItem(),
            ProductItem(),
            ProductItem(),
            ProductItem(),
            ProductItem(),
            ProductItem(),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: CupertinoButton(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
            child: Text(
              "Add New Product",
              style: TextStyle(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  fontSize: 14),
            ),
            onPressed: () {
              Get.to(AddProduct(),transition: Transition.fadeIn);
            },
          ),
        )
      ],
    );
  }
}
