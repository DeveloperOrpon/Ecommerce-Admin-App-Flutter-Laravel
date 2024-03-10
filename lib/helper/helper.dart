import 'dart:async';
import 'dart:developer';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../model/orderRes.dart';

printLog(String message) {
  log(message, name: 'DevOrpon', time: DateTime.now());
}

showSuccessToastTop(String title, String message, BuildContext context) {
  CherryToast.success(
      animationCurve: Curves.fastOutSlowIn,
      borderRadius: 10,
      width: Get.width,
      backgroundColor: Theme.of(context).primaryColor,
      animationDuration: const Duration(milliseconds: 400),
      toastDuration: const Duration(seconds: 2),
      toastPosition: Position.top,
      animationType: AnimationType.fromTop,
      description: Text(message,
          maxLines: 1, style: const TextStyle(color: Colors.white,fontSize: 12)),
      title: Text(
        title,
        style:
            const TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
        maxLines: 1,
      )).show(context);
}

showErrorToast(String title, String message, BuildContext context) {
  CherryToast.error(
      animationCurve: Curves.fastOutSlowIn,
      borderRadius: 10,
      width: Get.width,
      iconWidget: Icon(
        Icons.error_outlined,
        color: Colors.white,
      ),
      // shadowColor: Colors.red.shade100,

      backgroundColor: Colors.deepPurple,
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

startLoading() {
  Get.dialog(Container(
    height: 200,
    width: 300,
    child: const SpinKitThreeBounce(
      color: Colors.deepPurple,
      size: 40,
    ),
  ));
}

deleteDialog(BuildContext context, {required Function onTap}) {
  showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
            title: const Text('Alert'),
            content: const Text('Are you sure want to delete'),
            actions: <CupertinoDialogAction>[
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('No'),
              ),
              CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () {
                  onTap();
                  Navigator.pop(context);
                },
                child: const Text('Yes'),
              ),
            ],
          ));

  startLoading() async {
    Get.dialog(const SizedBox(
      height: 100,
      width: 200,
      child: SpinKitThreeBounce(
        color: Colors.white,
      ),
    ));
  }
}

// extension StringExtension on String {
//   String capitalize() {
//     return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
//   }
// }

String dateFormatOrder(String inputDate) {
  DateTime date = DateTime.parse(inputDate);
  String formattedDate = DateFormat('dd MMM, yyyy').format(date);
  return formattedDate;
}
String dateFormatDataBase(DateTime dateTime) {
  String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
  return formattedDate;
}

String countOrderProductQuantity(List<LineItems> lineItems) {
  int count = 0;
  for (var element in lineItems) {
    count += element.quantity ?? 0;
  }
  return count.toString();
}
