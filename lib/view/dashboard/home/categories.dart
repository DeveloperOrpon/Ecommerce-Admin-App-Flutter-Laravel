import 'package:ashique_admin_app/config/appConst.dart';
import 'package:ashique_admin_app/controller/productController.dart';
import 'package:ashique_admin_app/model/Category.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/api/api_route.dart';

class CategoriesHome extends StatelessWidget {
  const CategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    final productController=Get.put(ProductController());
    return Obx(() {
        return Container(
          height: 120,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => _categoryTile(context,productController.allCategoryList.value[index]),
            itemCount: productController.allCategoryList.value.length,
          ),
        );
      }
    );
  }

  _categoryTile(BuildContext context, CategoryModel categoryModel) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Stack(
        children: [
          SizedBox(
            height: 120,
            width: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: "$CATEGORY_IMAGE_URL${categoryModel.icon}",
                progressIndicatorBuilder: (context, url, downloadProgress) =>const CupertinoActivityIndicator(),
                errorWidget: (context, url, error) => Image.asset(appLogo),
              ),
            ),
          ),
          Container(
            height: 120,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: CupertinoColors.black.withOpacity(.4)),
          ),
          SizedBox(
            height: 120,
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  '${categoryModel.name}',
                  style: TextStyle(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('(${categoryModel.count})',
                    style: TextStyle(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
