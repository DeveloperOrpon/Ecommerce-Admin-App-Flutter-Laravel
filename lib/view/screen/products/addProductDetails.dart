import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../homeScreen.dart';
import 'addHtmlDiscription.dart';
import 'addVariant.dart';

class AddProductDetails extends StatefulWidget {
  const AddProductDetails({super.key});

  @override
  State<AddProductDetails> createState() => _AddProductDetailsState();
}

class _AddProductDetailsState extends State<AddProductDetails> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
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
            Row(
              children: [
                Container(
                  height: 90,
                  margin: EdgeInsets.all(6),
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: Colors.grey.shade500, width: .5)),
                  child: Icon(
                    Icons.image,
                    size: 60,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Add Product Thumbnail Image',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    height: 100,
                    margin: EdgeInsets.all(6),
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: Colors.grey.shade500, width: .5)),
                  ),
                  Container(
                    height: 100,
                    margin: EdgeInsets.all(6),
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: Colors.grey.shade500, width: .5)),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Add Product Images Up to 10 images',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 13.0, vertical: 7),
              child: FormBuilderTextField(
                name: 'name',
                decoration: InputDecoration(
                    labelText: 'Product Name',
                    labelStyle: TextStyle(fontSize: 12)),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                autofillHints: const [AutofillHints.name],
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 13.0, vertical: 7),
                    child: FormBuilderTextField(
                      name: 'price',
                      initialValue: '0.00',
                      decoration: InputDecoration(
                          labelText: 'Pice',
                          prefixIcon: Icon(CupertinoIcons.money_dollar),
                          labelStyle: TextStyle(fontSize: 12)),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                      autofillHints: const [AutofillHints.name],
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(),
                          child: FormBuilderTextField(
                            name: 'discount',
                            initialValue: '0.00',
                            decoration: const InputDecoration(
                                labelText: 'Discount',
                                prefixIcon: Icon(CupertinoIcons.money_dollar),
                                labelStyle: TextStyle(fontSize: 12)),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                            ]),
                            autofillHints: const [AutofillHints.name],
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: FormBuilderDropdown(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                          name: 'discountType',
                          items: [
                            DropdownMenuItem(
                                child: Text('Percentance',
                                    style: TextStyle(fontSize: 12)))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                TextButton.icon(
                    onPressed: () {
                      Get.to(AddHtmlDescription(),
                          transition: Transition.cupertino);
                    },
                    label: const Text('Add Product Documentations'),
                    icon: Icon(CupertinoIcons.doc_plaintext)),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Category',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                TextButton.icon(
                    onPressed: () {},
                    label: const Text('Assign Product Categories'),
                    icon: Icon(CupertinoIcons.add)),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Variant Product',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                TextButton.icon(
                    onPressed: () {
                      Get.to(AddVariantScreen(),
                          transition: Transition.cupertino);
                    },
                    label: const Text('Add Variant'),
                    icon: Icon(CupertinoIcons.add)),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13.0),
                    child: FormBuilderTextField(
                      name: 'unit',
                      initialValue: '1',
                      decoration: const InputDecoration(
                          labelText: 'Product Unit',
                          labelStyle: TextStyle(fontSize: 12)),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                      autofillHints: const [AutofillHints.name],
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: FormBuilderDropdown(
                    decoration: InputDecoration(),
                    name: 'unitType',
                    items: [
                      DropdownMenuItem(
                          child: Text('Piece', style: TextStyle(fontSize: 12))),
                    ],
                  ),
                )
              ],
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
                      'Feature Product',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    onChanged: field.didChange,
                    value: field.value ?? false,
                  ),
                );
              },
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
                  'Add Product'.toUpperCase(),
                  style:
                      TextStyle(color: Colors.white, fontFamily: 'robotoMono'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
