import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

showAddCategoryDialog(BuildContext context) {
  final _formKey = GlobalKey<FormBuilderState>();
  showModalBottomSheet(
      context: context,
      isScrollControlled: true, // only work on showModalBottomSheet function
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      )),
      builder: (context) => Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: Get.height * .3,
                width: Get.width,
                child: FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'Add Category',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(CupertinoIcons.xmark))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13.0, vertical: 7),
                        child: FormBuilderTextField(
                          name: 'name',
                          decoration: const InputDecoration(
                              labelText: 'Category Name',
                              labelStyle: TextStyle(fontSize: 12)),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                          autofillHints: const [AutofillHints.name],
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CupertinoButton(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.saveAndValidate()) {
                              if (true) {}
                            }
                            debugPrint(_formKey.currentState?.value.toString());
                          },
                          child: Text(
                            'Add Category'.toUpperCase(),
                            style:
                            TextStyle(color: Colors.white, fontFamily: 'robotoMono'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ));
}
