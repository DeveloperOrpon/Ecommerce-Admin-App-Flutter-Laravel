import 'dart:io';

import 'package:ashique_admin_app/controller/webConfigController.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../config/textStyle.dart';
import '../../../helper/imagePicker.dart';
import '../../widget/productSwitch.dart';

class WebConfig extends StatelessWidget {
  static const String routeName = 'WebConfig';

  const WebConfig({super.key});

  @override
  Widget build(BuildContext context) {
    final webConfigController=Get.put(WebConfigController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              foregroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarBrightness: Brightness.dark,
                statusBarIconBrightness: Brightness.dark,
              ),
              pinned: true,
              floating: true,
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: const Text(
                'WebConfig',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              actions: [
                // IconButton(
                  // onPressed: () {}, icon: const Icon(CupertinoIcons.add),)
              ],
            ),
            SliverList(delegate: SliverChildListDelegate([
              Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(
                      color: Theme
                          .of(context)
                          .primaryColor,
                      width: .4,
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const  Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Icon(Icons.apple),
                                    Text("Apple Store Status"),
                                  ],
                                ),
                              ),
                              CustomSwitch(value: false),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6.0, vertical: 7),
                            child: FormBuilderTextField(
                              obscureText: true,
                              name: 'Link',
                              decoration: decoration(
                                  title: 'Link',
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
                      color: Theme
                          .of(context)
                          .primaryColor,
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
                              Expanded(
                                child: Row(
                                  children: [
                                    Icon(CupertinoIcons.play),
                                    Text("Google Play Store Status"),
                                  ],
                                ),
                              ),
                              CustomSwitch(value: false),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6.0, vertical: 7),
                            child: FormBuilderTextField(
                              obscureText: true,
                              name: 'Link',
                              decoration: decoration(
                                  title: 'Link',
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
                      color: Theme
                          .of(context)
                          .primaryColor,
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
                              Expanded(
                                child: Row(
                                  children: [
                                    Icon(CupertinoIcons.news),
                                    Text("Website Information's"),
                                  ],
                                ),
                              ),

                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6.0, vertical: 7),
                            child: FormBuilderTextField(
                              obscureText: true,
                              name: 'Name',
                              decoration: decoration(
                                  title: 'Name',
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
                          ), Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6.0, vertical: 7),
                            child: FormBuilderTextField(
                              obscureText: true,
                              name: 'Email',
                              decoration: decoration(
                                  title: 'Email',
                                  context: context,
                                  iconData: Icons.email,
                                  hideText: true),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.maxWordsCount(8),
                              ]),
                              autofillHints: const [AutofillHints.email],
                              style: const TextStyle(fontSize: 14),
                            ),
                          ), Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6.0, vertical: 7),
                            child: FormBuilderTextField(
                              obscureText: true,
                              name: 'Phone',
                              decoration: decoration(
                                  title: 'Phone',
                                  context: context,
                                  iconData: Icons.phone,
                                  hideText: true),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.maxWordsCount(8),
                              ]),
                              autofillHints: const [AutofillHints.email],
                              style: const TextStyle(fontSize: 14),
                            ),
                          ), Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6.0, vertical: 7),
                            child: FormBuilderTextField(
                              obscureText: true,
                              name: 'CopyRight',
                              decoration: decoration(
                                  title: 'Copy Right',
                                  context: context,
                                  iconData: Icons.copyright,
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
                      color: Theme
                          .of(context)
                          .primaryColor,
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
                              Expanded(
                                child: Row(
                                  children: [
                                    Icon(Icons.monitor),
                                    SizedBox(width: 5),
                                    Text("Web Logo"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                Row(
                  children: [
                    Obx(() {
                      return webConfigController.webLogo.value != null
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
                                webConfigController.webLogo.value!,
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
                                    webConfigController.webLogo.value = null;
                                  },
                                  icon: Icon(
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
                          webConfigController.webLogo.value =
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
                      color: Theme
                          .of(context)
                          .primaryColor,
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
                              Expanded(
                                child: Row(
                                  children: [
                                    Icon(Icons.mobile_friendly_sharp),
                                    SizedBox(width: 5),
                                    Text('Mobile Logo'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                Row(
                  children: [
                    Obx(() {
                      return webConfigController.mobileLogo.value != null
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
                                webConfigController.mobileLogo.value!,
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
                                    webConfigController.mobileLogo.value = null;
                                  },
                                  icon: Icon(
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
                          webConfigController.webLogo.value =
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
                      color: Theme
                          .of(context)
                          .primaryColor,
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
                              Expanded(
                                child: Row(
                                  children: [
                                    Icon(Icons.folder_copy_outlined),
                                    SizedBox(width: 5),
                                    Text('Web Footer Logo'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                Row(
                  children: [
                    Obx(() {
                      return webConfigController.webFooterLogo.value != null
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
                                webConfigController.webFooterLogo.value!,
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
                                    webConfigController.webFooterLogo.value = null;
                                  },
                                  icon: Icon(
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
                          webConfigController.webFooterLogo.value =
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
                      color: Theme
                          .of(context)
                          .primaryColor,
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
                              Expanded(
                                child: Row(
                                  children: [
                                    Icon(Icons.face),
                                    SizedBox(width: 5),
                                    Text('Fav Icon'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                Row(
                  children: [
                    Obx(() {
                      return webConfigController.favIcon.value != null
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
                                webConfigController.favIcon.value!,
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
                                    webConfigController.favIcon.value = null;
                                  },
                                  icon: Icon(
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
                          webConfigController.favIcon.value =
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
                      color: Theme
                          .of(context)
                          .primaryColor,
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
                              Expanded(
                                child: Row(
                                  children: [
                                    Icon(Icons.color_lens),
                                    SizedBox(width: 5),
                                    Text('Web Colors Setup'),
                                  ],
                                ),

                              ),

                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(8)
                                ),
                                width: 80,
                                height: 40,
                              ),
                              TextButton(onPressed: () async {
                                final Color newColor =
                                    await showColorPickerDialog(context, Colors.red,pickersEnabled:{

                                      ColorPickerType.primary: true,
                                      ColorPickerType.accent: true,
                                      ColorPickerType.wheel: true,
                                    });

                                Map<String, dynamic> colorMap ={};
                                colorMap.addAll({
                                  ColorTools.materialName(newColor).split('[')[0]:
                                  ColorTools.materialNameAndCode(newColor)
                                      .split('(')[1]
                                      .split(')')[0],
                                });

                              }, child: const Text("Pick Primary")),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(8)
                                ),
                                width: 80,
                                height: 40,
                              ),
                              TextButton(onPressed: () async {
                                final Color newColor =
                                    await showColorPickerDialog(context, Colors.red,pickersEnabled:{

                                      ColorPickerType.primary: true,
                                      ColorPickerType.accent: true,
                                      ColorPickerType.wheel: true,
                                    });

                                Map<String, dynamic> colorMap ={};
                                colorMap.addAll({
                                  ColorTools.materialName(newColor).split('[')[0]:
                                  ColorTools.materialNameAndCode(newColor)
                                      .split('(')[1]
                                      .split(')')[0],
                                });

                              }, child: const Text("Pick Secondary")),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]))
          ],
        ),
      ),
    );
  }
}
