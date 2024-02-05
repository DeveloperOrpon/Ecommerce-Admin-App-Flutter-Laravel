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

class AddFlashDeal extends StatelessWidget {
  const AddFlashDeal({super.key});

  @override
  Widget build(BuildContext context){
  final dealController = Get.put(DealController());
    Future.delayed(
      const Duration(milliseconds: 100),
          () {
        Navigator.of(context).restorablePush(infoWithImageDialog,
            arguments:['assets/images/flash.png',"The 'Add Flash Deal Product' feature empowers users to include specific items in time-limited promotions, enhancing sales and customer engagement through targeted marketing strategies and exclusive offers."]);
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
          'Add Flash Deals',
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
              Row(
                children: [
                  Obx(() {
                    return dealController.selectDealImage.value != null
                        ? Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 90,
                          margin: EdgeInsets.all(6),
                          width: 90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.grey.shade500,
                                  width: .5)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              dealController.selectDealImage.value!,
                              width: 90,
                              height: 90,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          left: 0,
                          top: 0,
                          bottom: 0,
                          child: InkWell(
                            child: IconButton(
                                onPressed: () {
                                  dealController
                                      .selectDealImage.value = null;
                                },
                                icon: const Icon(
                                  Icons.delete_rounded,
                                  color: Colors.red,
                                  size: 30,
                                )),
                          ),
                        )
                      ],
                    )
                        : Center();
                  }),
                  InkWell(
                    onTap: () async {
                      List<File>? selectImages =
                      await pickImage(context: context);
                      if (selectImages != null) {
                        dealController.selectDealImage.value =
                        selectImages[0];
                      }
                    },
                    child: Container(
                      height: 90,
                      margin: EdgeInsets.all(6),
                      width: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.grey.shade500, width: .5)),
                      child: Icon(
                        Icons.add_a_photo,
                        size: 50,
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Add Flash Deals Thumbnail Image',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
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
                padding: const EdgeInsets.all(8.0),
                child: CupertinoButton(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                  onPressed: () {
                    if (dealController.uploadKey.currentState!.saveAndValidate()) {
                      if (true) {}
                    }
                    debugPrint(dealController.uploadKey.currentState?.value.toString());
                  },
                  child: Text(
                    'Add Flash Deals'.toUpperCase(),
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
