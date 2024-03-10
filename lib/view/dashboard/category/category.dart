import 'package:ashique_admin_app/view/dashboard/category/addCategory.dart';
import 'package:ashique_admin_app/view/widget/categoryTile.dart';
import 'package:ashique_admin_app/view/widget/productItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/productController.dart';

class CategoryInfo extends StatelessWidget {
  const CategoryInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final productController=Get.put(ProductController());
    return Container(
      color: Colors.grey.shade100,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Obx(() {
              return ListView.builder(
                itemCount: productController.allCategoryList.value.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => CategoryTile( productController.allCategoryList.value[index]),
              );
            }
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: CupertinoButton(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
              child: Text(
                "Add New Category",
                style: TextStyle(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontSize: 14),
              ),
              onPressed: () {
                Get.to(AddCategory(), transition: Transition.fadeIn);
              },
            ),
          )
        ],
      ),
    );
  }
}
