import 'dart:developer';

import 'package:ashique_admin_app/config/appConst.dart';
import 'package:ashique_admin_app/config/refresh.dart';
import 'package:ashique_admin_app/controller/paymentController.dart';
import 'package:ashique_admin_app/helper/helper.dart';
import 'package:ashique_admin_app/view/manage/shipping/addShippingMthod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../config/textStyle.dart';
import '../../../controller/BusinessSettingController.dart';
import '../../widget/productSwitch.dart';

class PaymentMethod extends StatelessWidget {
  static const String routeName = 'PaymentMethod';

  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    final paymentController = Get.put(PaymentController());
    final businessSettingController = Get.put(BusinessSettingController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
        title: const Text(
          'PaymentMethod Method',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: Obx((){
          return businessSettingController.businessRes.value==null?const Center(child: CupertinoActivityIndicator()): SmartRefresher(
            physics: const BouncingScrollPhysics(),
            enablePullDown: true,
            enablePullUp: true,
            header: refreshLoading(context),
            footer: customFooter,
            controller: paymentController.refreshController,
            onRefresh: paymentController.onRefresh,
            onLoading: paymentController.onLoading,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverList(
                    delegate: SliverChildListDelegate([
                  const SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                    child: Row(
                      children: [
                        const CircleAvatar(radius: 8),
                        SizedBox(width: 5),
                        Text(
                          "Available PaymentMethod Method",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            // fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                    padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).primaryColor.withOpacity(.1)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 15),
                        Container(
                          padding: EdgeInsets.all(12),
                          margin: EdgeInsets.only(bottom: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: .4,
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Cash On Delivery"),
                              Obx(() {
                                  return CustomSwitch(
                                    value: businessSettingController
                                            .businessRes.value!.data!
                                            .firstWhere((element) =>
                                                element.type == "cash_on_delivery")
                                            .value['status'] ==
                                        '1',
                                    onTap: () {
                                      log('${businessSettingController
                                          .businessRes.value!.data!
                                          .firstWhere((element) =>
                                      element.type ==
                                          "cash_on_delivery")
                                          .value['status']}');
                                      paymentController.updatePaymentMethod({
                                        "status": businessSettingController
                                                    .businessRes.value!.data!
                                                    .firstWhere((element) =>
                                                        element.type ==
                                                        "cash_on_delivery")
                                                    .value['status'] ==
                                                '1'
                                            ? "0"
                                            : "1"
                                      }, "cash_on_delivery").then((value) {
                                        businessSettingController.getSetting();
                                      });
                                    },
                                  );
                                }
                              ),
                            ],
                          ),
                        ),
                        FormBuilder(
                          key: businessSettingController.formKeySSL,
                          child: Container(
                            padding: EdgeInsets.all(12),
                            margin: EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: .4,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                       Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("SSL Commerce Pay"),
                                          Obx(() {
                                            return CustomSwitch(
                                              value: businessSettingController
                                                  .businessRes.value!.data!
                                                  .firstWhere((element) =>
                                              element.type == "ssl_commerz_payment")
                                                  .value['status'] ==
                                                  '1',
                                              onTap: () {
                                                log('${businessSettingController
                                                    .businessRes.value!.data!
                                                    .firstWhere((element) =>
                                                element.type ==
                                                    "ssl_commerz_payment")
                                                    .value['status']}');
                                                paymentController.updatePaymentMethod({
                                                  "status": businessSettingController
                                                      .businessRes.value!.data!
                                                      .firstWhere((element) =>
                                                  element.type ==
                                                      "ssl_commerz_payment")
                                                      .value['status'] ==
                                                      '1'
                                                      ? "0"
                                                      : "1",
                                                  "store_id":businessSettingController.formKeySSL.currentState!.value['store_id'],
                                                  "store_password":businessSettingController.formKeySSL.currentState!.value['store_password']
                                                }, "ssl_commerz_payment").then((value) {
                                                  businessSettingController.getSetting();
                                                });
                                              },
                                            );
                                          }
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6.0, vertical: 7),
                                        child: FormBuilderTextField(
                                          initialValue:  businessSettingController
                                              .businessRes.value!.data!
                                              .firstWhere((element) =>
                                          element.type ==
                                              "ssl_commerz_payment")
                                              .value['store_id'],
                                          // obscureText: true,
                                          name: 'store_id',
                                          decoration: decoration(
                                              title: 'Store ID',
                                              context: context,
                                              iconData: Icons.numbers,
                                              hideText: true),
                                          validator: FormBuilderValidators.compose([
                                            FormBuilderValidators.required(),
                                            FormBuilderValidators.maxWordsCount(8),
                                          ]),
                                          autofillHints: const [AutofillHints.email],
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6.0, vertical: 7),
                                        child: FormBuilderTextField(
                                          // obscureText: true,
                                          initialValue: businessSettingController
                                              .businessRes.value!.data!
                                              .firstWhere((element) =>
                                          element.type ==
                                              "ssl_commerz_payment")
                                              .value['store_password'],
                                          name: 'store_password',
                                          decoration: decoration(
                                              title: 'Store Password',
                                              context: context,
                                              iconData: Icons.numbers,
                                              hideText: true),
                                          validator: FormBuilderValidators.compose([
                                            FormBuilderValidators.required(),
                                            FormBuilderValidators.maxWordsCount(8),
                                          ]),
                                          autofillHints: const [AutofillHints.email],
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                      ),
                                      _smallButton(context, 'Save',(){
                                        if (businessSettingController.formKeySSL.currentState
                                            ?.saveAndValidate() ??
                                            false){
                                          printLog("message");
                                          startLoading();
                                          Map<String,dynamic> map={};
                                          map.addAll(businessSettingController.formKeySSL.currentState!.value);
                                          map.addAllIf(true, {
                                            'status':businessSettingController
                                                .businessRes.value!.data!
                                                .firstWhere((element) =>
                                            element.type ==
                                                "ssl_commerz_payment")
                                                .value['status'].toString(),
                                          });
                                          paymentController.updatePaymentMethod(map, "ssl_commerz_payment").then((value) async {
                                            await businessSettingController.getSetting();
                                            Get.back();
                                          });
                                        }

                                      })
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(12),
                          margin: EdgeInsets.only(bottom: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: .4,
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Paypal Payment"),
                                        CustomSwitch(value: false),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6.0, vertical: 7),
                                      child: FormBuilderTextField(
                                        obscureText: true,
                                        name: 'url',
                                        decoration: decoration(
                                            title: 'Paypal ClientID',
                                            context: context,
                                            iconData: Icons.numbers,
                                            hideText: true),
                                        validator: FormBuilderValidators.compose([
                                          FormBuilderValidators.required(),
                                          FormBuilderValidators.maxWordsCount(8),
                                        ]),
                                        autofillHints: const [AutofillHints.email],
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6.0, vertical: 7),
                                      child: FormBuilderTextField(
                                        obscureText: true,
                                        name: 'url',
                                        decoration: decoration(
                                            title: 'Paypal Secret',
                                            context: context,
                                            iconData: Icons.numbers,
                                            hideText: true),
                                        validator: FormBuilderValidators.compose([
                                          FormBuilderValidators.required(),
                                          FormBuilderValidators.maxWordsCount(8),
                                        ]),
                                        autofillHints: const [AutofillHints.email],
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(12),
                          margin: EdgeInsets.only(bottom: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: .4,
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Stripe Payment"),
                                        CustomSwitch(value: false),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6.0, vertical: 7),
                                      child: FormBuilderTextField(
                                        obscureText: true,
                                        name: 'url',
                                        decoration: decoration(
                                            title: 'PublishedKey',
                                            context: context,
                                            iconData: Icons.numbers,
                                            hideText: true),
                                        validator: FormBuilderValidators.compose([
                                          FormBuilderValidators.required(),
                                          FormBuilderValidators.maxWordsCount(8),
                                        ]),
                                        autofillHints: const [AutofillHints.email],
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6.0, vertical: 7),
                                      child: FormBuilderTextField(
                                        obscureText: true,
                                        name: 'url',
                                        decoration: decoration(
                                            title: 'API Key',
                                            context: context,
                                            iconData: Icons.numbers,
                                            hideText: true),
                                        validator: FormBuilderValidators.compose([
                                          FormBuilderValidators.required(),
                                          FormBuilderValidators.maxWordsCount(8),
                                        ]),
                                        autofillHints: const [AutofillHints.email],
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(12),
                          margin: EdgeInsets.only(bottom: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: .4,
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Stripe Payment"),
                                        CustomSwitch(value: false),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6.0, vertical: 7),
                                      child: FormBuilderTextField(
                                        obscureText: true,
                                        name: 'url',
                                        decoration: decoration(
                                            title: 'PublishedKey',
                                            context: context,
                                            iconData: Icons.numbers,
                                            hideText: true),
                                        validator: FormBuilderValidators.compose([
                                          FormBuilderValidators.required(),
                                          FormBuilderValidators.maxWordsCount(8),
                                        ]),
                                        autofillHints: const [AutofillHints.email],
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6.0, vertical: 7),
                                      child: FormBuilderTextField(
                                        obscureText: true,
                                        name: 'url',
                                        decoration: decoration(
                                            title: 'API Key',
                                            context: context,
                                            iconData: Icons.numbers,
                                            hideText: true),
                                        validator: FormBuilderValidators.compose([
                                          FormBuilderValidators.required(),
                                          FormBuilderValidators.maxWordsCount(8),
                                        ]),
                                        autofillHints: const [AutofillHints.email],
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(12),
                          margin: EdgeInsets.only(bottom: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: .4,
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Paystack"),
                                        CustomSwitch(value: false),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6.0, vertical: 7),
                                      child: FormBuilderTextField(
                                        obscureText: true,
                                        name: 'url',
                                        decoration: decoration(
                                            title: 'PublishedKey',
                                            context: context,
                                            iconData: Icons.numbers,
                                            hideText: true),
                                        validator: FormBuilderValidators.compose([
                                          FormBuilderValidators.required(),
                                          FormBuilderValidators.maxWordsCount(8),
                                        ]),
                                        autofillHints: const [AutofillHints.email],
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6.0, vertical: 7),
                                      child: FormBuilderTextField(
                                        obscureText: true,
                                        name: 'url',
                                        decoration: decoration(
                                            title: 'Secret Key',
                                            context: context,
                                            iconData: Icons.numbers,
                                            hideText: true),
                                        validator: FormBuilderValidators.compose([
                                          FormBuilderValidators.required(),
                                          FormBuilderValidators.maxWordsCount(8),
                                        ]),
                                        autofillHints: const [AutofillHints.email],
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6.0, vertical: 7),
                                      child: FormBuilderTextField(
                                        obscureText: true,
                                        name: 'url',
                                        decoration: decoration(
                                            title: 'Payment Url',
                                            context: context,
                                            iconData: Icons.numbers,
                                            hideText: true),
                                        validator: FormBuilderValidators.compose([
                                          FormBuilderValidators.required(),
                                          FormBuilderValidators.maxWordsCount(8),
                                        ]),
                                        autofillHints: const [AutofillHints.email],
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6.0, vertical: 7),
                                      child: FormBuilderTextField(
                                        obscureText: true,
                                        name: 'url',
                                        decoration: decoration(
                                            title: 'Merchant Email',
                                            context: context,
                                            iconData: Icons.numbers,
                                            hideText: true),
                                        validator: FormBuilderValidators.compose([
                                          FormBuilderValidators.required(),
                                          FormBuilderValidators.maxWordsCount(8),
                                        ]),
                                        autofillHints: const [AutofillHints.email],
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 10),
                  //   child: CupertinoButton(
                  //     onPressed: () {
                  //       Get.to(const AddShippingMethod(),transition: Transition.rightToLeftWithFade);
                  //     },
                  //     color: Theme.of(context).primaryColor,
                  //     child: const Text("Add More Method",style: TextStyle(
                  //       color: Colors.white,
                  //       fontSize: 14,
                  //       fontWeight: FontWeight.bold,
                  //     ),),
                  //   ),
                  // )
                ]))
              ],
            ),
          );
        }
      ),
    );
  }
  _smallButton(BuildContext context,String text,Function onTap){
    return Align(
      alignment: Alignment.topRight,
      child: InkWell(
        onTap: () {
          log("Click");
          onTap();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 7),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            )
          ),
          child: Text(text,style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),),
        ),
      ),
    );
  }
}
