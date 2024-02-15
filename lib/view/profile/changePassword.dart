import 'dart:io';

import 'package:ashique_admin_app/controller/AuthenticationController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../helper/imagePicker.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

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
              title: const Text('Change Password'),
            ),
            SliverList(delegate: SliverChildListDelegate([
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 13.0, vertical: 7),
                child: FormBuilderTextField(
                  name: 'NewPassword',
                  decoration: const InputDecoration(
                      labelText: 'New Password',
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
                  name: 'ConfirmPassword',
                  decoration: const InputDecoration(
                      labelText: 'Confirm Password',
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
