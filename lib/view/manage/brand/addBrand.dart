import 'dart:io';

import 'package:ashique_admin_app/config/api/api_route.dart';
import 'package:ashique_admin_app/controller/brandController.dart';
import 'package:ashique_admin_app/model/Brand.dart';
import 'package:ashique_admin_app/view/manage/customer/model/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../helper/helper.dart';
import '../../../helper/imagePicker.dart';

class AddBrand extends StatelessWidget {
  final Brand? brand;
  const AddBrand({super.key, this.brand});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    if(brandController.selectBrandThumbnail.value!=null){
      brandController.selectBrandThumbnail.value=null;
    }
    Future.delayed(
      const Duration(milliseconds: 100),
      () {
        Navigator.of(context).restorablePush(infoWithImageDialog, arguments: [
          'assets/images/brand.png',
          "The 'Add Brand' feature enables users to seamlessly integrate new brands into the system, expanding product options and enhancing user experience."
        ]);
      },
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
        title:  Text(
          '${brand==null?"Add":'Update'}  Brand',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body:  FormBuilder(
        key: brandController.formKey,
        child: ListView(
          padding: EdgeInsets.all(10),
          physics: BouncingScrollPhysics(),
          children: [
            Row(
              children: [
                Obx(() {
                  return brandController.selectBrandThumbnail.value != null
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
                                  brandController.selectBrandThumbnail.value!,
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
                                      brandController.selectBrandThumbnail.value =
                                          null;
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
                      :brand==null? Center():ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      BRAND_IMAGE_URL+brand!.image.toString(),
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  );
                }),
                InkWell(
                  onTap: () async {
                    List<File>? selectImages = await pickImage(context: context);
                    if (selectImages != null) {
                      brandController.selectBrandThumbnail.value =
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                '${brand==null?"Add":'Update'} Brand Thumbnail Image',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 7),
              child: FormBuilderTextField(
                initialValue: brand==null?'':brand!.name,
                name: 'name',
                decoration: const InputDecoration(
                    labelText: 'Brand Name', labelStyle: TextStyle(fontSize: 12)),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                autofillHints: const [AutofillHints.name],
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(() {
                  return CupertinoButton(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                    onPressed: brandController.selectBrandThumbnail.value == null && brand==null
                        ? null
                        : () {
                            if (brandController.formKey.currentState
                                    ?.saveAndValidate() ??
                                false) {
                              startLoading();
                             if(brand==null){
                               brandController
                                   .addBrand(
                                   brandController.formKey.currentState
                                       ?.fields['name']!.value)
                                   .then((value) {
                                 Get.back();
                                 Get.back();
                               }).catchError((onError) {
                                 showErrorToast('Warning',
                                     'Band Upload Error Try Again', context);
                               });
                             }else{
                               brandController
                                   .updateBrand(name: brandController.formKey.currentState
                                   ?.fields['name']!.value,id: brand!.id.toString())
                                   .then((value) {
                                 Get.back();
                                 Get.back();
                               }).catchError((onError) {
                                 showErrorToast('Warning',
                                     'Band Update Error Try Again', context);
                               });
                             }
                            }
                          },
                    child: Text(
                      '${brand==null?"Add":'Update'}  Brand'.toUpperCase(),
                      style: const TextStyle(color: Colors.white, fontFamily: 'robotoMono'),
                    ),
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
