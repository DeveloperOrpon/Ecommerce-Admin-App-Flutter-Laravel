import 'dart:developer';

import 'package:ashique_admin_app/config/appConst.dart';
import 'package:ashique_admin_app/helper/helper.dart';
import 'package:ashique_admin_app/view/manage/shipping/addShippingMthod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../config/textStyle.dart';
import '../../../controller/shippingMethodController.dart';
import '../../widget/productSwitch.dart';

class AddShippingMethod extends StatelessWidget {
  static const String routeName = 'AddShippingMethod';

  const AddShippingMethod({super.key});

  @override
  Widget build(BuildContext context) {
    final shippingMethodController = Get.put(ShippingMethodController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child:  FormBuilder(
          key: shippingMethodController.uploadKey,
          child: CustomScrollView(
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
                  'Add Shipping Method',
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
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(
                    "Add Shipping Method",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(
                    "Add a shipping method for user best delivery experience",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 12,
                    ),
                  ),
                ),
                    SizedBox(height: 10)
              ])),
              SliverList(
                  delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 7),
                  child: FormBuilderTextField(

                    name: 'title',
                    decoration: decoration(
                        title: 'Method Title',
                        context: context,
                        iconData: CupertinoIcons.tag,
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

                    name: 'duration',
                    decoration: decoration(
                        title: 'Duration (days)',
                        context: context,
                        iconData: CupertinoIcons.time,
                        hideText: true),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    autofillHints: const [AutofillHints.email],
                    style: const TextStyle(fontSize: 14),
                  ),
                ),Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 7),
                  child: FormBuilderTextField(
                    name: 'cost',
                    decoration: decoration(
                        title: 'Cost',
                        context: context,
                        iconData: Icons.attach_money_sharp,
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 20),
                      child: CupertinoButton(
                        onPressed:() {
                          if (
                          shippingMethodController.uploadKey.currentState
                              ?.saveAndValidate() ??
                              false){
                            log("${shippingMethodController.uploadKey.currentState!.value.toString()}");
                            startLoading();
                            shippingMethodController.addShippingMethod(shippingMethodController.uploadKey.currentState!.value).then((value){
                              Get.back();
                              Get.back();
                            }).catchError((onError){
                              showErrorToast('Warning', 'ShippingMethod Upload Error Try Again', context);
                            });
                          }
                        },
                        color: Theme.of(context).primaryColor,
                        disabledColor: Colors.grey,
                        child: const Text(
                          "Add",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
