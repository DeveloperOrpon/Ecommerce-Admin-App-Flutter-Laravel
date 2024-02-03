import 'dart:io';

import 'package:ashique_admin_app/controller/bannerController.dart';
import 'package:ashique_admin_app/helper/imagePicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../config/appConst.dart';
import '../../../config/textStyle.dart';

class UploadBanner extends StatelessWidget {
  static const String routeName = 'uploadBanner';

  const UploadBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final bannerController = Get.put(BannerController());
    bannerController.selectBannerImage.value=null;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: FormBuilder(
        key: bannerController.uploadKey,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  const SliverAppBar(
                    foregroundColor: Colors.white,
                    surfaceTintColor: Colors.white,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarBrightness: Brightness.dark,
                      statusBarIconBrightness: Brightness.dark,
                    ),
                    backgroundColor: Colors.white,
                    pinned: true,
                    floating: true,
                    title: Text(
                      'Upload Banner',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.normal),
                    ),
                  ),
                  SliverList(
                      delegate: SliverChildListDelegate([
                    Text(
                      "Select a Image to upload Banner Image",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      "Please select image (100*300px) size for better preview",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 10),
                  ])),

                  ///Images
                  SliverList(
                    delegate: SliverChildListDelegate([
                      InkWell(
                        onTap: () async {
                          List<File>? file = await pickImage(context: context);
                          if (file != null) {
                            bannerController.selectBannerImage.value = file[0];
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.all(5),
                          height: 130,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Obx(() {
                            return bannerController.selectBannerImage.value ==
                                    null
                                ? Icon(
                                    Icons.add_a_photo,
                                    color: Theme.of(context).primaryColor,
                                    size: 40,
                                  )
                                : Image.file(
                                    bannerController.selectBannerImage.value!,
                                    width: 130,
                                    fit: BoxFit.cover,
                                  );
                          }),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 7),
                        child: FormBuilderTextField(
                          obscureText: true,
                          name: 'url',
                          decoration: decoration(
                              title: 'Banner Url',
                              context: context,
                              iconData: CupertinoIcons.upload_circle_fill,
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
                            horizontal: 12.0, vertical: 20),
                        child: Obx(() {
                          return CupertinoButton(
                            onPressed:
                                bannerController.selectBannerImage.value == null
                                    ? null
                                    : () {
                                        if (bannerController
                                                .uploadKey.currentState
                                                ?.saveAndValidate() ??
                                            false) {}
                                      },
                            color: Theme.of(context).primaryColor,
                            disabledColor: Colors.grey,
                            child: Text(
                              "Upload",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          );
                        }),
                      )
                    ]),
                  ),
                ])),
      ),
    );
  }
}
