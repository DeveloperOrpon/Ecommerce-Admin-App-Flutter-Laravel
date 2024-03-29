import 'package:ashique_admin_app/controller/productAddController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../homeScreen.dart';
import 'addProductDetails.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();
    final addProductController=Get.put(ProductAddController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Adding a product"),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(CupertinoIcons.xmark),
        ),
      ),
      body: FormBuilder(
        key: _formKey,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 13.0, vertical: 7),
              child: FormBuilderTextField(
                name: 'name',
                decoration: const InputDecoration(
                    labelText: 'Name', labelStyle: TextStyle(fontSize: 12)),
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
                name: 'price',
                initialValue: '0.00',
                decoration: const InputDecoration(
                    labelText: 'Price',
                    prefixIcon: Icon(CupertinoIcons.money_dollar),
                    labelStyle: TextStyle(fontSize: 12)),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                ]),
                autofillHints: const [AutofillHints.name],
                style: const TextStyle(fontSize: 14),
              ),
            ),
            FormBuilderFieldDecoration<bool>(
              name: 'stock',

              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.equal(true),
              ]),
              // initialValue: true,
              decoration: const InputDecoration(labelText: 'stock'),
              builder: (FormFieldState<bool?> field) {
                return InputDecorator(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorText: field.errorText,
                  ),
                  child: SwitchListTile(
                    activeTrackColor: Theme.of(context).primaryColor,
                    activeColor: Colors.white,
                    title: const Text(
                      'Stock control',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    onChanged: field.didChange,

                    value: field.value ?? false,
                  ),
                );
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Enable stock control to track inventory.When a customer buys a product, the quantity is reduced automatically.',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoButton(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                onPressed: () {
                  if (_formKey.currentState!.saveAndValidate()) {
                    if (true) {
                      addProductController.productName.value=_formKey.currentState!.value["name"]??"";
                      addProductController.productPrice.value=_formKey.currentState!.value["price"]??"";
                      Get.to(const AddProductDetails(),transition: Transition.cupertino);
                    }
                  }
                  debugPrint(_formKey.currentState?.value.toString());
                },
                child: Text(
                  'Add Product'.toUpperCase(),
                  style:
                      const TextStyle(color: Colors.white, fontFamily: 'robotoMono'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
