import 'dart:convert';

import 'package:ashique_admin_app/model/adminRes.dart';
import 'package:ashique_admin_app/view/dashboard/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../config/appConst.dart';
import '../../config/cache_stroage/localStroage.dart';
import '../../controller/AuthenticationController.dart';
import '../../controller/productAddController.dart';
import '../../helper/helper.dart';
import 'authentication/loginScreen.dart';

class RedirectScreen extends StatelessWidget {
  const RedirectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ProductAddController productAddController = Get.put(ProductAddController());
    final authController=Get.put(AuthenticationController());
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark));
    Future.delayed(
      const Duration(seconds: 1),
      () async {
        String? jwt=await LocalStorage.getJWT();
        String? userMapString=await LocalStorage.getUserInformation();
        if(jwt==null || jwt.isEmpty) {
          Get.offAll(const LoginScreen(),
            transition: Transition.rightToLeftWithFade);
        }else{
          Map<String, dynamic> userMap =json.decode(userMapString!);
          printLog("userMapString ${userMapString.runtimeType}");
          printLog("userMapString ${jwt}");
          AdminRes adminRes=AdminRes.fromJson(userMap);
          authController.adminRes.value=adminRes;
          Get.offAll(const HomeScreen(),transition: Transition.cupertino,);
        }
      },
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Center(
        child: Image.asset(appLogo),
      ),
    );
  }
}
