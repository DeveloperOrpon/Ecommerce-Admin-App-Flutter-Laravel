import 'package:ashique_admin_app/config/appConst.dart';
import 'package:ashique_admin_app/view/manage/shipping/addShippingMthod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../config/textStyle.dart';
import '../../widget/productSwitch.dart';

class PaymentMethod extends StatelessWidget {
  static const String routeName = 'PaymentMethod';

  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          const SliverAppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
            ),
            pinned: true,
            floating: true,
            title: Text(
              'PaymentMethod Method',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
              child: Text(
                "Available PaymentMethod Method",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  // fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
              padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).primaryColor.withOpacity(.1)),
              child: Column(
              mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 15),
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
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Cash On Delivery"),
                        ProductSwitch(),
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
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("SSL Commerce Pay"),
                                  ProductSwitch(),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 7),
                                child: FormBuilderTextField(
                                  obscureText: true,
                                  name: 'url',
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
                              ),Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 7),
                                child: FormBuilderTextField(
                                  obscureText: true,
                                  name: 'url',
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
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Paypal Payment"),
                                  ProductSwitch(),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 7),
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
                              ),Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 7),
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
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
              padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).primaryColor.withOpacity(.1)),
              child:  Column(
                mainAxisSize: MainAxisSize.min,
                children: [
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
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Cash On Delivery"),
                        ProductSwitch(),
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
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("SSL Commerce Pay"),
                                  ProductSwitch(),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 7),
                                child: FormBuilderTextField(
                                  obscureText: true,
                                  name: 'url',
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
                              ),Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 7),
                                child: FormBuilderTextField(
                                  obscureText: true,
                                  name: 'url',
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
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Stripe Payment"),
                                  ProductSwitch(),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 7),
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
                              ),Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 7),
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
}
