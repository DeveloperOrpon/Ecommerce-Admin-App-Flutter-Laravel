import 'dart:developer';
import 'dart:io';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:ashique_admin_app/controller/productAddController.dart';
import 'package:ashique_admin_app/controller/productController.dart';
import 'package:ashique_admin_app/helper/imagePicker.dart';
import 'package:ashique_admin_app/model/Brand.dart';
import 'package:ashique_admin_app/view/modal/addProductCategory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../config/api/api_route.dart';
import '../../../controller/brandController.dart';
import '../../../model/Category.dart';
import '../../widget/networkImage.dart';
import '../homeScreen.dart';
import 'addHtmlDiscription.dart';
import 'addVariant.dart';

class AddProductDetails extends StatelessWidget {
  const AddProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());
    final addProductController = Get.put(ProductAddController());
    final brandController = Get.put(BrandController());
    final _formKey = GlobalKey<FormBuilderState>();
    return WillPopScope(
      onWillPop: () async {
        addProductController.productImages.value = [];
        addProductController.selectProductThumbnail.value = null;
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text("Adding a product"),
          leading: IconButton(
            onPressed: () {
              Get.back();
              addProductController.productImages.value = [];
              addProductController.selectProductThumbnail.value = null;
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
                                        color: Colors.grey.shade500,
                                        width: .5)),
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
                                            .selectProductThumbnail
                                            .value = null;
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
                          border: Border.all(
                              color: Colors.grey.shade500, width: .5)),
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
                      ...addProductController.productImages.value
                          .map((e) => Stack(
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
                                            addProductController
                                                    .productImages.value =
                                                addProductController
                                                    .productImages.value
                                                    .where((element) =>
                                                        element != e)
                                                    .toList();
                                          },
                                          icon: const Icon(
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
                          List<File>? selectImages = await pickImage(
                              context: context, multiImage: true);
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
                  initialValue: addProductController.productName.value,
                  decoration: const InputDecoration(
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
                        name: 'unit_price',
                        initialValue: addProductController.productPrice.value,
                        decoration: const InputDecoration(
                            labelText: 'Unit price',
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 13.0, vertical: 7),
                      child: FormBuilderTextField(
                        name: 'purchase_price',
                        initialValue: addProductController.productPrice.value,
                        decoration: const InputDecoration(
                            labelText: 'Purchase price',
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
                ],
              ),
              Row(
                children: [

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
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                            name: 'discountType',
                            items: const [
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
                        addProductController.controller.insertText(
                            addProductController.productDescription.value);
                        Get.to(const AddHtmlDescription(),
                            transition: Transition.cupertino);
                      },
                      label: const Text('Add Product Documentations'),
                      icon: const Icon(CupertinoIcons.doc_plaintext)),
                  const Spacer(),
                  Obx(() {
                    return addProductController.productDescription.value.isEmpty
                        ? const Icon(
                            CupertinoIcons.xmark_seal_fill,
                            color: Colors.red,
                          )
                        : const Icon(
                            CupertinoIcons.checkmark_alt,
                            color: Colors.green,
                          );
                  })
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Select Category',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
              Obx(() {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomDropdown<CategoryModel>.multiSelect(
                    decoration: CustomDropdownDecoration(
                      closedBorderRadius: BorderRadius.circular(4),
                      closedBorder: const Border(
                          bottom:BorderSide(
                            color: Colors.black,
                            width: 1,
                          )
                      ),
                    ),
                    headerListBuilder: _customDropDownExampleMultiSelection,
                    listItemBuilder:
                        (context, selectedItem, isSelected, onItemSelect) =>
                            Row(
                      children: [
                        NetworkImagePreview(
                          url: "$CATEGORY_IMAGE_URL${selectedItem.icon}",
                          width: 40,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          selectedItem.name.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Spacer(),
                        Text(
                          selectedItem.count.toString(),
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    hintText: 'Select Categories',
                    hintBuilder: (context, hint) => Text(
                      hint,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      ),
                    ),

                    items: productController.allCategoryList.value,
                    // initialItem: _list[0],
                    onListChanged: (value) {
                      // addProductController.selectParentCategory.value. = value;
                    },
                  ),
                );
              }),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Select Brand',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
              Obx(() {
                return brandController.allBrand.value.isEmpty?const Text("Please Wait.. No Brand Found..",style: TextStyle(
                  color: Colors.red,fontWeight: FontWeight.bold,
                ),) :Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomDropdown<Brand>(
                    decoration: CustomDropdownDecoration(
                      closedBorderRadius: BorderRadius.circular(4),
                      closedBorder: const Border(
                        bottom:BorderSide(
                        color: Colors.black,
                        width: 1,
                        )
                      ),
                    ),
                    headerBuilder: (context, selectedItem) => Row(
                      children: [
                        NetworkImagePreview(
                          url: "$BRAND_IMAGE_URL${selectedItem.image}",
                          width: 40,
                          height: 40,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          selectedItem.name.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Spacer(),
                        Text(
                          selectedItem.brandProductsCount.toString(),
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    listItemBuilder:
                        (context, selectedItem, isSelected, onItemSelect) =>
                            Row(
                      children: [
                        NetworkImagePreview(
                          url: "$BRAND_IMAGE_URL${selectedItem.image}",
                          width: 40,
                          height: 40,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          selectedItem.name.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Spacer(),
                        Text(
                          selectedItem.brandProductsCount.toString(),
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    hintText: 'Select Brand',
                    hintBuilder: (context, hint) => Text(
                      hint,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      ),
                    ),
                    items: brandController.allBrand.value,
                    onChanged: (Brand) {},
                  ),
                );
              }),
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
                            child:
                                Text('Piece', style: TextStyle(fontSize: 12))),
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
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
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
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'robotoMono'),
                  ),
                ),
              ),
              const SizedBox(height: 50)
            ],
          ),
        ),
      ),
    );
  }
}

Widget _customDropDownExampleMultiSelection(
    BuildContext context, List<CategoryModel> selectedItems) {
  if (selectedItems.isEmpty) {
    return const ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: CircleAvatar(),
      title: Text("No item selected"),
    );
  }
  return Wrap(
    children: selectedItems.map((e) {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: NetworkImagePreview(
          url: "$CATEGORY_IMAGE_URL${e.icon}",
          width: 40,
          height: 40,
        ),
      );
    }).toList(),
  );
}
