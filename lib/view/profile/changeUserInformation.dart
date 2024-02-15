import 'dart:io';

import 'package:ashique_admin_app/controller/AuthenticationController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../helper/imagePicker.dart';

class ChangeUserInformation extends StatelessWidget {
  const ChangeUserInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final authenticationController =Get.put(AuthenticationController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: true,
              centerTitle: true,
              title: const Text('Update Profile'),
            ),
            SliverList(delegate: SliverChildListDelegate([
              Row(
                children: [
                  Obx(() {
                    return authenticationController.selectUploadProfileImage.value != null
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
                              authenticationController.selectUploadProfileImage.value!,
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
                                  authenticationController.selectUploadProfileImage.value = null;
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
                        authenticationController.selectUploadProfileImage.value =
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
                  'Select For Upload Profile Image',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 13.0, vertical: 7),
                child: FormBuilderTextField(
                  name: 'FullName',
                  decoration: const InputDecoration(
                      labelText: 'Full Name',
                      labelStyle: TextStyle(fontSize: 12)),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                  autofillHints: const [AutofillHints.name],
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 13.0, vertical: 7),
                child: FormBuilderTextField(
                  name: 'Phone',
                  decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(fontSize: 12)),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                  autofillHints: const [AutofillHints.name],
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 13.0, vertical: 7),
                child: FormBuilderTextField(
                  name: 'Email',
                  decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(fontSize: 12)),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                  autofillHints: const [AutofillHints.name],
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoButton(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                  onPressed: () {
                    // if (_formKey.currentState!.saveAndValidate()) {
                    //   if (true) {}
                    // }
                    // debugPrint(_formKey.currentState?.value.toString());
                  },
                  child: Text(
                    'Upload'.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'robotoMono'),
                  ),
                ),
              ),
            ]))
          ],
        ),
      ),
    );
  }
}
