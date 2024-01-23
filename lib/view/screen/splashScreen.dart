import 'package:ashique_admin_app/config/appConst.dart';
import 'package:ashique_admin_app/view/screen/authentication/loginScreen.dart';
import 'package:ashique_admin_app/view/screen/homeScreen.dart';
import 'package:ashique_admin_app/view/screen/products/addProductDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/productAddController.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductAddController productAddController = Get.put(ProductAddController());

    Future.delayed(
      const Duration(seconds: 1),
      () {
        // Get.to(const HomeScreen(), transition: Transition.fadeIn);
        Get.to(const AddProductDetails(), transition: Transition.fadeIn);
      },
    );
    return Scaffold(
      body: Center(
        child: Image.asset(appLogo),
      ),
    );
  }
}
