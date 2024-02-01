import 'dart:ui';

import 'package:ashique_admin_app/config/appConst.dart';
import 'package:ashique_admin_app/controller/homeController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';
import 'package:get/get.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController=Get.put(HomeController());
    return Gallery3D(
        controller: homeController.controller,

        itemConfig:  GalleryItemConfig(
            width: 200,
            height: 220,
            radius: 10,
            isShowTransformMask: true,

            shadows: [
              BoxShadow(
                  color: Colors.grey.shade200, offset: const Offset(2, 0), blurRadius: 2)
            ]
        ),
        width: MediaQuery.of(context).size.width,
        height: 220,
        isClip: true,
        onItemChanged: (index) {
        },
        onClickItem: (index) {
          if (kDebugMode) print("currentIndex:$index");
        },
        itemBuilder: (context, index) {
          return Image.network(
           homeController.demoImages[index],
            fit: BoxFit.fill,
          );
        });
  }
}