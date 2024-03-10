import 'dart:ui';

import 'package:ashique_admin_app/config/api/api_route.dart';
import 'package:ashique_admin_app/config/appConst.dart';
import 'package:ashique_admin_app/controller/homeController.dart';
import 'package:ashique_admin_app/controller/productController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';
import 'package:get/get.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    final productController = Get.put(ProductController());
    return Obx(() {
        return  homeController.controller.value==null?const Center():Gallery3D(
            controller: homeController.controller.value!,
            itemConfig: GalleryItemConfig(
                width: 200,
                height: 220,
                radius: 10,
                isShowTransformMask: true,
                shadows: [
                  BoxShadow(
                      color: Colors.grey.shade200,
                      offset: const Offset(2, 0),
                      blurRadius: 2)
                ]),
            width: MediaQuery.of(context).size.width,
            height: 220,
            isClip: true,
            onItemChanged: (index) {},
            onClickItem: (index) {
              if (kDebugMode) print("currentIndex:$index");
            },
            itemBuilder: (context, index) {
              return Stack(
                alignment: Alignment.bottomCenter,
                fit: StackFit.expand,
                children: [
                  Image.network(
                    "$PRODUCT_THUMBMAIL_IMAGE_URL${productController.bestSellingProduct[index].thumbnail}",
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 150.0),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: const Text(
                              maxLines: 1,
                              textAlign: TextAlign.justify,
                              overflow: TextOverflow.ellipsis,
                              "Iphone 15 Pro Max Black 256GB",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: const Text(
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    "Price\n 10,000 $currency",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  color: Colors.white,
                                ),
                                Expanded(
                                  child: const Text(
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    "Orders\n 10",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            });
      }
    );
  }
}
