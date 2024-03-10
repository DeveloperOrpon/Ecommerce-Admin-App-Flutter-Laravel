import 'dart:async';

import 'package:ashique_admin_app/helper/helper.dart';
import 'package:ashique_admin_app/model/orderRes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/orderController.dart';

Future<void>showBottomSheetDialog(BuildContext context, OrderModel orderModel) async {
  Get.put(OrderController()).selectOrderStatus.value='';
 return showModalBottomSheet(
    backgroundColor: CupertinoColors.white,
    context: context,
    builder: (context) => Container(
      decoration: const BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          )),
      height: Get.height * .35,
      padding: EdgeInsets.all(14),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              "Choose Status Update",
              style: GoogleFonts.alef(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          Divider(),
          SizedBox(height: 10),
          OrderHelper().tile(
            'Order Status',
            () {
              OrderHelper().showOrderStatusDialog(context, orderModel);
            },
            context,
          ),
          // OrderHelper().tile('Shipping Status', () {
          //   // OrderHelper().showShippingStatusDialog(context,orderModel);
          // } ,context,),
          OrderHelper().tile(
            'Payment Status',
            () {
              OrderHelper().showPaymentStatusDialog(context, orderModel);
            },
            context,
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: CupertinoButton(
                onPressed: () {
                  Get.back();
                },
                color: Theme.of(context).primaryColor,
                child: const Text(
                  'Close',
                  style: TextStyle(color: CupertinoColors.white),
                )),
          )
        ],
      ),
    ),
  );
}

class OrderHelper {
  showOrderStatusDialog(BuildContext context, OrderModel orderModel) {
    final orderController = Get.put(OrderController());
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: CupertinoColors.white,
      context: context,
      builder: (context) => Container(
        decoration: const BoxDecoration(
            color: CupertinoColors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
            )),
        height: Get.height * .8,
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Order Status",
                style: GoogleFonts.alef(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            const Divider(),
            const SizedBox(height: 10),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                return Obx(() => tile(
                    orderController.orderStatus[index],
                    () {
                      orderController.selectOrderStatus.value =
                          orderController.orderStatus[index];
                    },
                    context,
                    radioButton: () {
                      orderController.selectOrderStatus.value =
                          orderController.orderStatus[index];
                    },
                    radioButtonValue:
                        orderController.selectOrderStatus.value.isEmpty
                            ? orderModel.status.toString()
                            : orderController.selectOrderStatus.value,
                    showRadioButton: true));
              },
              itemCount: orderController.orderStatus.length,
            )),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: CupertinoButton(
                  onPressed: () {
                    orderController.updateOrderStatus(orderModel.id.toString()).then((value){
                      showSuccessToastTop('Information', 'OrderStatus Updated', context);
                      Get.back();
                    }).catchError((onError){
                      showErrorToast('Warning', 'Something Error Try Again', context);
                    });
                  },
                  color: Theme.of(context).primaryColor,
                  child: const Text(
                    'UPDATE STATUS',
                    style: TextStyle(color: CupertinoColors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }

  showShippingStatusDialog(BuildContext context, OrderModel orderModel) {
    final orderController = Get.put(OrderController());
    showModalBottomSheet(
      backgroundColor: CupertinoColors.white,
      context: context,
      builder: (context) => Container(
        decoration: const BoxDecoration(
            color: CupertinoColors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
            )),
        height: Get.height * .7,
        padding: EdgeInsets.all(14),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Shipping Status",
                style: GoogleFonts.alef(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            Divider(),
            SizedBox(height: 10),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                printLog(
                    "Value: ${orderController.shippingStatus} ${orderModel.shippingMethodTitle.toString()}");
                return tile(
                    orderController.shippingStatus[index], () {}, context,
                    radioButton: () {},
                    radioButtonValue: orderModel.shippingMethodTitle.toString(),
                    showRadioButton: true);
              },
              itemCount: orderController.shippingStatus.length,
            )),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: CupertinoButton(
                  onPressed: () {
                    Get.back();
                  },
                  color: Theme.of(context).primaryColor,
                  child: const Text(
                    'UPDATE STATUS',
                    style: TextStyle(color: CupertinoColors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }

  showPaymentStatusDialog(BuildContext context, OrderModel orderModel) {
    final orderController = Get.put(OrderController());
    showModalBottomSheet(
      backgroundColor: CupertinoColors.white,
      context: context,
      builder: (context) => Container(
        decoration: const BoxDecoration(
            color: CupertinoColors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
            )),
        height: Get.height * .7,
        padding: EdgeInsets.all(14),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Payment Status",
                style: GoogleFonts.alef(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            Divider(),
            SizedBox(height: 10),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                // printLog("Value: ${  orderController.paymentStatus[index]} ${orderModel.paymentStatus.toString()}");
                return Obx(() => tile(
                    orderController.paymentStatus[index],
                        () {
                      orderController.selectPaymentStatus.value =
                      orderController.paymentStatus[index];
                    },
                    context,
                    radioButton: () {
                      orderController.selectPaymentStatus.value =
                      orderController.paymentStatus[index];
                    },
                    radioButtonValue:
                    orderController.selectPaymentStatus.value.isEmpty
                        ? orderModel.paymentStatus.toString()
                        : orderController.selectPaymentStatus.value,
                    showRadioButton: true));
              },
              itemCount: orderController.paymentStatus.length,
            )),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: CupertinoButton(
                  onPressed: () {
                    orderController.updatePaymentStatus(orderModel.id.toString()).then((value){
                      showSuccessToastTop('Information', 'Payment Status Updated', context);
                      Get.back();
                    }).catchError((onError){
                      showErrorToast('Warning', 'Something Error Try Again', context);
                    });
                  },
                  color: Theme.of(context).primaryColor,
                  child: const Text(
                    'UPDATE STATUS',
                    style: TextStyle(color: CupertinoColors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }

  tile(String title, Function onTileTap, BuildContext context,
      {bool showRadioButton = false,
      String radioButtonValue = '',
      Function? radioButton}) {
    return InkWell(
      onTap: () {
        onTileTap();
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: 50,
        decoration: BoxDecoration(
          color: radioButtonValue.toUpperCase() == title.toUpperCase()
              ? Theme.of(context).primaryColor.withOpacity(.3)
              : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(child: Text(title)),
            showRadioButton
                ? Radio(
                    fillColor: MaterialStatePropertyAll(
                        Theme.of(context).primaryColor),
                    value: title.toUpperCase(),
                    groupValue: radioButtonValue.toUpperCase(),
                    onChanged: (value) {
                      radioButton!();
                    },
                  )
                : const Icon(Icons.arrow_forward_ios_rounded)
          ],
        ),
      ),
    );
  }
}
