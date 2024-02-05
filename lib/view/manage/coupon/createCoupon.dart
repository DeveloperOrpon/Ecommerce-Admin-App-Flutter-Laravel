import 'package:ashique_admin_app/config/textStyle.dart';
import 'package:ashique_admin_app/controller/couponController.dart';
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
            onPressed: () {},
            icon: const Icon(Icons.countertops),
            label: const Text('Submit'),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 7),
              child: FormBuilderDropdown<String>(
                initialValue: couponController.couponType[0],
                name: 'options',
                validator: FormBuilderValidators.required(),
                decoration:
                    const InputDecoration(label: Text("Select the Type")),
                onChanged: (value) {
                  // setState(() {
                  //   option = value;
                  // }) ;
                },
                items: couponController.couponType
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
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
                      name: 'DiscountType',
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
                              (e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6.0, vertical: 7),
                    child: FormBuilderTextField(
                      obscureText: true,
                      name: 'Discount',
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
                        FormBuilderValidators.maxWordsCount(8),
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
                obscureText: true,
                name: 'Title',
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
                  FormBuilderValidators.maxWordsCount(8),
                ]),
                autofillHints: const [AutofillHints.email],
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 7),
              child: FormBuilderTextField(
                obscureText: true,
                name: 'Code',
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
                  FormBuilderValidators.maxWordsCount(8),
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
                  child: showSingleDatePicker(context, "Start Date", () {}),
                )),
                Expanded(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6.0, vertical: 7),
                  child: showSingleDatePicker(context, "End Date", () {}),
                )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 7),
              child: FormBuilderTextField(
                obscureText: true,
                name: 'MinimumPurchase',
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
                  FormBuilderValidators.maxWordsCount(8),
                ]),
                autofillHints: const [AutofillHints.email],
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 7),
              child: FormBuilderTextField(
                obscureText: true,
                name: 'MaximumDiscount',
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
                  FormBuilderValidators.maxWordsCount(8),
                ]),
                autofillHints: const [AutofillHints.email],
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
