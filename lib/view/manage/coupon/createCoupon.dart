import 'dart:developer';

import 'package:ashique_admin_app/config/textStyle.dart';
import 'package:ashique_admin_app/controller/couponController.dart';
import 'package:ashique_admin_app/helper/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../order/showDateDialog.dart';

class CreateCoupon extends StatelessWidget {
  const CreateCoupon({super.key});

  @override
  Widget build(BuildContext context) {
    final couponController = Get.put(CouponController());
    couponController.expireTime.value=null;
    couponController.startTime.value=null;
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
          'Create Coupon Discount',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              if (couponController
                  .uploadKey.currentState
                  ?.saveAndValidate() ??
                  false){
                if(couponController.startTime.value==null || couponController.expireTime.value==null){
                  showErrorToast('Warning', 'Please Select Start and End Date', context);
                }
                Map<String,dynamic> couponMap={};
                couponMap.addAll(couponController.uploadKey.currentState!.value);
                couponMap.addAll({
                  'start_date':dateFormatDataBase(couponController.startTime.value!),
                  "expire_date":dateFormatDataBase(couponController.expireTime.value!)
                });
                startLoading();
                couponController.addCoupon(couponMap).then((value){
                  Get.back();
                  Get.back();
                }).catchError((onError){
                  showErrorToast('Warning', 'Coupon Adding Error', context);
                });
              }
            },
            icon: const Icon(Icons.countertops),
            label: const Text('Submit'),
          )
        ],
      ),
      body:  FormBuilder(
        key: couponController.uploadKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 7),
                child: FormBuilderDropdown<String>(
                  initialValue: couponController.couponType[0],
                  name: 'coupon_type',
                  validator: FormBuilderValidators.required(),
                  decoration:
                      const InputDecoration(label: Text("Select the Type")),
                  onChanged: (value) {
                    // setState(() {
                    //   option = value;
                    // }) ;
                  },
                  items: couponController.couponType
                      .map((e) => DropdownMenuItem(value: e.replaceAll(' ', '_').toLowerCase(), child: Text(e)))
                      .toList(),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6.0, vertical: 7),
                      child: FormBuilderDropdown<String>(
                        initialValue: couponController.discountType[0],
                        name: 'discount_type',
                        validator: FormBuilderValidators.required(),
                        decoration:
                            const InputDecoration(label: Text("Discount Type")),
                        onChanged: (value) {
                          // setState(() {
                          //   option = value;
                          // });
                        },
                        items: couponController.discountType
                            .map(
                                (e) => DropdownMenuItem(value: e.toLowerCase(), child: Text(e)))
                            .toList(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6.0, vertical: 7),
                      child: FormBuilderTextField(
                        name: 'discount',
                        decoration: decoration(
                            inputBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: .4,
                              ),
                            ),
                            fillColor: Colors.white,
                            title: 'Discount',
                            context: context,
                            iconData: Icons.discount,
                            hideText: true),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.numeric(),
                        ]),
                        autofillHints: const [AutofillHints.email],
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 7),
                child: FormBuilderTextField(
                  name: 'title',
                  decoration: decoration(
                      inputBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: .4,
                        ),
                      ),
                      fillColor: Colors.white,
                      title: 'Title',
                      context: context,
                      iconData: Icons.takeout_dining,
                      hideText: true),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),

                  ]),
                  autofillHints: const [AutofillHints.email],
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 7),
                child: FormBuilderTextField(
                  name: 'code',
                  decoration: decoration(
                      inputBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: .4,
                        ),
                      ),
                      fillColor: Colors.white,
                      title: 'Coupon Code',
                      context: context,
                      iconData: Icons.monitor_heart,
                      hideText: true),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),

                  ]),
                  autofillHints: const [AutofillHints.email],
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6.0, vertical: 7),
                    child: Obx(() => showSingleDatePicker(context, "Start Date\n${couponController.startTime.value!=null?dateFormatDataBase(couponController.startTime.value!):""}", (date) {
                      couponController.startTime.value=date;
                    })),
                  )),
                  Expanded(
                      child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6.0, vertical: 7),
                    child: Obx(() => showSingleDatePicker(context, "End Date\n${couponController.expireTime.value!=null?dateFormatDataBase(couponController.expireTime.value!):""}", (date) {
                      couponController.expireTime.value=date;
                    })),
                  )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 7),
                child: FormBuilderTextField(
                  name: 'min_purchase',
                  decoration: decoration(
                      inputBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: .4,
                        ),
                      ),
                      fillColor: Colors.white,
                      title: 'Minimum Purchase',
                      context: context,
                      iconData: Icons.monetization_on,
                      hideText: true),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.numeric(),
                  ]),
                  autofillHints: const [AutofillHints.email],
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 7),
                child: FormBuilderTextField(
                  name: 'max_discount',
                  decoration: decoration(
                      inputBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                          width: .4,
                        ),
                      ),
                      fillColor: Colors.white,
                      title: 'Maximum Discount',
                      context: context,
                      iconData: Icons.monetization_on,
                      hideText: true),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.numeric(),
                  ]),
                  autofillHints: const [AutofillHints.email],
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
