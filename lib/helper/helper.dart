import 'dart:developer';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

printLog(String message) {
  log(message, name: 'DevOrpon', time: DateTime.now());
}

showSuccessToastTop(String title, String message, BuildContext context) {
  CherryToast.success(
      animationCurve: Curves.fastOutSlowIn,
      borderRadius: 10,
      width: Get.width,
      shadowColor: Colors.green.shade100,
      backgroundColor: Colors.green.shade100,
      animationDuration: const Duration(milliseconds: 400),
      toastDuration: const Duration(seconds: 2),
      toastPosition: Position.top,
      animationType: AnimationType.fromTop,
      description: Text(message, style: const TextStyle(color: Colors.black)),
      title: Text(
        title,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        maxLines: 2,
      )).show(context);
}
showErrorToast(String title, String message, BuildContext context) {
  CherryToast.error(
      animationCurve: Curves.fastOutSlowIn,
      borderRadius: 10,
      width: Get.width,
      iconWidget: Icon(Icons.error_outlined,color: Colors.white,),
      // shadowColor: Colors.red.shade100,

      backgroundColor:  Colors.deepPurple,
      animationDuration: const Duration(milliseconds: 400),
      toastDuration: const Duration(seconds: 2),
      toastPosition: Position.top,
      animationType: AnimationType.fromTop,
      description: Text(message, style: const TextStyle(color: Colors.white)),
      title: Text(
        title,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        maxLines: 2,
      )).show(context);
}

startLoading(){
  Get.dialog(Container(
    height: 200,
    width: 300,
    child: const SpinKitThreeBounce(
      color:  Colors.deepPurple,
      size: 40,
    ),
  ));
}