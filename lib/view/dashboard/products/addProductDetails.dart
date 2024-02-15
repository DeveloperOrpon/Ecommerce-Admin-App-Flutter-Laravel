import 'dart:developer';
import 'dart:io';

import 'package:ashique_admin_app/controller/productAddController.dart';
import 'package:ashique_admin_app/helper/imagePicker.dart';
import 'package:ashique_admin_app/view/modal/addProductCategory.dart';
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
    final addProductController = Get.put(ProductAddController());
    return WillPopScope(
      onWillPop: () async{
        addProductController.productImages.value=[];
        addProductController.selectProductThumbnail.value=null;
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text("Adding a product"),
          leading: IconButton(
            onPressed: () {
              Get.back();
              addProductController.productImages.value=[];
              addProductController.selectProductThumbnail.value=null;
            },
            icon: Icon(CupertinoIcons.xmark),
          ),
        ),
        body: FormBuilder(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(10),
            physics: BouncingScrollPhysics(),
            children: [
              Row(
                children: [
                  Obx(() {
                    return addProductController.selectProductThumbnail.value !=
                            null
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
                                        color: Colors.grey.shade500, width: .5)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    addProductController
                                        .selectProductThumbnail.value!,
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
                                        addProductController
                                            .selectProductThumbnail.value = null;
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
                        addProductController.selectProductThumbnail.value =
                            selectImages[0];
                      }
                    },
                    child: Container(
                      height: 90,
                      margin: EdgeInsets.all(6),
                      width: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(color: Colors.grey.shade500, width: .5)),
                      child: Icon(
                        Icons.add_a_photo,
                        size: 40,
                      ),
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
                child: Obx(() {
                  return ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...addProductController.productImages.value.map((e) =>
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: 90,
                                margin: EdgeInsets.all(6),
                                width: 90,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.grey.shade500, width: .5)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    e,
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
                                        addProductController.productImages.value =
                                            addProductController
                                                .productImages.value
                                                .where((element) => element != e)
                                                .toList();
                                      },
                                      icon: Icon(
                                        Icons.delete_rounded,
                                        color: Colors.red,
                                        size: 30,
                                      )),
                                ),
                              )
                            ],
                          )),
                      InkWell(
                        onTap: () async {
                          List<File>? selectImages =
                              await pickImage(context: context, multiImage: true);
                          if (selectImages != null) {
                            List<File> temp =
                                addProductController.productImages.value;
                            temp.addAll(selectImages);
                            addProductController.productImages.value = [];
                            addProductController.productImages.value = temp;
                          }
                        },
                        child: Container(
                          height: 90,
                          margin: EdgeInsets.all(6),
                          width: 90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.grey.shade500, width: .5)),
                          child: const Icon(
                            Icons.add_a_photo,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                      text: 'Add Product Images Up to 6 images\n',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    TextSpan(
                      text: '(Tap and Hold for select multiple image one time)',
                      style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.italic,
                          color: Colors.black87),
                    ),
                  ]),
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
                      onPressed: () {
                        showCategoryDialog(context);
                      },
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
      ),
    );
  }
}
