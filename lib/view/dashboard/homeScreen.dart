import 'package:ashique_admin_app/controller/homeController.dart';
import 'package:ashique_admin_app/view/dashboard/products/product.dart';
import 'package:ashique_admin_app/view/widget/bottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_background/object/palette.dart';
import 'package:live_background/widget/live_background_widget.dart';

import '../../controller/productController.dart';
import '../manage/manage.dart';
import '../order/order.dart';
import '../profile/profile.dart';
import 'home/home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController=Get.put(HomeController());
    final productController=Get.put(ProductController());
    return Scaffold(
      bottomNavigationBar: const BottomWidget(),
      body: Stack(
        children: [
           LiveBackgroundWidget(
              palette: Palette(colors: [Colors.red, Colors.green,Theme.of(context).primaryColor]),
              velocityX: 2.5,
              velocityY: 0,
              particleMinSize: 5,
              particleMaxSize: 30,
              particleCount: 15,
              blurSigmaX: 2,
              blurSigmaY: 0.5,
              clipBoundary: true //default value is true
          ),
          PageView(
            controller:homeController.pageController ,
            onPageChanged: (value) {
              homeController.homePageIndex.value=value;
            },
            children: const [
              HomeContent(),
              OrderContent(),
              ProductScreen(),
              ManageContent(),
              ProfileContent(),
            ],
          ),
        ],
      ),
    );
  }
}
