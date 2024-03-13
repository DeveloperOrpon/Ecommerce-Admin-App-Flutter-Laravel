import 'dart:developer';

import 'package:dio/dio.dart' as DIO;
import 'dart:io';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:ashique_admin_app/controller/productAddController.dart';
import 'package:ashique_admin_app/helper/helper.dart';
import 'package:ashique_admin_app/model/Category.dart';
import 'package:ashique_admin_app/view/widget/networkImage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../../config/api/api_route.dart';
import '../../../config/appConst.dart';
import '../../../controller/productController.dart';
import '../../../helper/imagePicker.dart';

class AddCategory extends StatelessWidget {
  final CategoryModel? categoryModel;

  const AddCategory({super.key, this.categoryModel});

  @override
  Widget build(BuildContext context) {
    final addProductController = Get.put(ProductAddController());
    final productController = Get.put(ProductController());
    final _formKey = GlobalKey<FormBuilderState>();
    addProductController.selectParentCategory.value = null;
    return Scaffold(
      appBar: AppBar(
        title:
            Text("${categoryModel == null ? "Adding a" : "Update"} Category"),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(CupertinoIcons.xmark),
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
                  return addProductController.selectCategoryThumbnail.value !=
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
                                      .selectCategoryThumbnail.value!,
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
                                          .selectCategoryThumbnail.value = null;
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
                      : Container(
                          height: 75,
                          width: 90,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: CachedNetworkImage(
                            imageUrl:
                                "$CATEGORY_IMAGE_URL${categoryModel?.icon}",
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    const CupertinoActivityIndicator(),
                            errorWidget: (context, url, error) =>
                                Image.asset(appLogo),
                          ),
                        );
                }),
                InkWell(
                  onTap: () async {
                    List<File>? selectImages =
                        await pickImage(context: context);
                    if (selectImages != null) {
                      addProductController.selectCategoryThumbnail.value =
                          selectImages[0];
                    }
                  },
                  child: Container(
                    height: 90,
                    margin: EdgeInsets.all(6),
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: Colors.grey.shade500, width: .5)),
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
                'Add Category Thumbnail Image',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 13.0, vertical: 7),
              child: FormBuilderTextField(
                initialValue: categoryModel != null ? categoryModel!.name : "",
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
              child: Text(
                'If Category Has Parent Category?',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            Obx(() {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomDropdown<CategoryModel>(
                  initialItem: categoryModel == null ||
                          categoryModel!.parentId == 0
                      ? null
                      : productController.allCategoryList.value.firstWhere(
                          (element) => element.id! == categoryModel!.parentId),
                  decoration: CustomDropdownDecoration(
                    closedBorderRadius: BorderRadius.circular(4),
                    closedBorder: Border.all(
                      color: Colors.black,
                      width: .5,
                    ),
                  ),
                  listItemBuilder:
                      (context, selectedItem, isSelected, onItemSelect) => Row(
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
                  hintText: 'Select Parent Category',
                  hintBuilder: (context, hint) => Text(
                    hint,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                  ),
                  headerBuilder: (context, selectedItem) => Row(
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
                  items: productController.allCategoryList.value,
                  // initialItem: _list[0],
                  onChanged: (value) {
                    addProductController.selectParentCategory.value = value;
                  },
                ),
              );
            }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoButton(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.saveAndValidate()) {
                    if (categoryModel == null) {
                      if (addProductController.selectCategoryThumbnail.value ==
                          null) {
                        showErrorToast('Warning',
                            'Please Select Category Thumbnail Image', context);
                        return;
                      }
                      startLoading();
                      productController
                          .addCategory(
                        _formKey.currentState!.value['name'],
                        addProductController.selectCategoryThumbnail.value!,
                        parentId: addProductController
                            .selectParentCategory.value?.id
                            .toString(),
                      )
                          .then((value) {
                        Get.back();
                        if (!value) {
                          showErrorToast(
                              'Warning', 'Something Error Try Again', context);
                        } else {
                          Get.back();
                        }
                      });
                    } else {
                      startLoading();
                      Map<String, dynamic> mapCategory = {
                        "name": _formKey.currentState!.value['name']
                      };

                      if (addProductController.selectParentCategory.value !=
                          null) {
                        mapCategory.addAll({
                          "parent_id": addProductController
                              .selectParentCategory.value!.id
                        });
                      }
                      log("mapCategory: ${mapCategory}");
                      var formData = DIO.FormData.fromMap(mapCategory);
                      if (addProductController.selectCategoryThumbnail.value !=
                          null) {
                        formData.files.addIf(
                            addProductController
                                    .selectCategoryThumbnail.value !=
                                null,
                            MapEntry(
                              'image',
                              await DIO.MultipartFile.fromFile(
                                  addProductController
                                      .selectCategoryThumbnail.value!.path),
                            ));
                      }
                      productController
                          .updateCategory(
                              categoryModel!.id.toString(), formData)
                          .then((value) {
                        Get.back();
                        if (!value) {
                          showErrorToast(
                              'Warning', 'Something Error Try Again', context);
                        } else {
                          Get.back();
                        }
                      });
                    }
                  }
                  debugPrint(_formKey.currentState?.value.toString());
                },
                child: Text(
                  'Add Category'.toUpperCase(),
                  style: const TextStyle(
                      color: Colors.white, fontFamily: 'robotoMono'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
