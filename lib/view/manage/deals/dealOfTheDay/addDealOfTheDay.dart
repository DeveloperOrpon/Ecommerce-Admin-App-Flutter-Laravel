import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../../config/textStyle.dart';
import '../../../../controller/couponController.dart';
import '../../../../controller/dealController.dart';
import '../../../../helper/imagePicker.dart';
import '../../../order/showDateDialog.dart';
import '../../customer/model/dialog.dart';
import '../flashDeal/addProductFlashDeal.dart';

class AddDealOfTheDay extends StatelessWidget {
  const AddDealOfTheDay({super.key});

  @override
  Widget build(BuildContext context) {
    final dealController = Get.put(DealController());
    Future.delayed(
      const Duration(milliseconds: 100),
      () {
        Navigator.of(context).restorablePush(infoWithImageDialog, arguments: [
          'assets/images/dealOfTheDay.png',
          "The feature empowers users to include specific items in time-limited promotions, enhancing sales and customer engagement through targeted marketing strategies and exclusive offers."
        ]);
      },
    );
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
          'Add Deal of The Day',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: FormBuilder(
        key: dealController.uploadKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6.0, vertical: 7),
                child: FormBuilderDropdown<String>(
                  // initialValue: ,
                  name: 'Add new product',
                  validator: FormBuilderValidators.required(),
                  decoration:
                      const InputDecoration(label: Text("Add new product")),
                  onChanged: (value) {
                    // setState(() {
                    //   option = value;
                    // });
                  },
                  items: List.generate(10, (index) => "$index")
                      .toList()
                      .map((e) => DropdownMenuItem(
                            value: e,
                    child: Text("data"),
                            // child: selectedProductTile(context,
                            //     isShowDeleteButton: false),
                          ))
                      .toList(),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6.0, vertical: 7),
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
                padding: const EdgeInsets.all(8.0),
                child: CupertinoButton(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                  onPressed: () {
                    if (dealController.uploadKey.currentState!
                        .saveAndValidate()) {
                      if (true) {}
                    }
                    debugPrint(dealController.uploadKey.currentState?.value
                        .toString());
                  },
                  child: Text(
                    'Add DealOfTheDay'.toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white, fontFamily: 'robotoMono'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
