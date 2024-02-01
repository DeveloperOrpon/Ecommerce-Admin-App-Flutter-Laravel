import 'package:ashique_admin_app/controller/homeController.dart';
import 'package:ashique_admin_app/view/screen/products/product.dart';
import 'package:ashique_admin_app/view/widget/bottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      body: PageView(
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
    );
  }
}
