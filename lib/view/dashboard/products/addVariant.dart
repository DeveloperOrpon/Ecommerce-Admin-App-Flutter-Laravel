import 'dart:developer';

import 'package:ashique_admin_app/extend/sliverAppBarDelegate.dart';
import 'package:ashique_admin_app/view/widget/productVariantItem.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../controller/productAddController.dart';
import '../../../controller/productController.dart';

class AddVariantScreen extends StatelessWidget {
  const AddVariantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductAddController productAddController = Get.put(ProductAddController());
    ProductController productController = Get.put(ProductController());
    if(productController.allAttribute.value.isEmpty){
      productController.getAttributes();
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title:  Text("Add Variant ${productController.allAttribute.value.length}"),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(CupertinoIcons.xmark),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {}, label: const Text('Save and Continue')),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Obx(() => Column(
            mainAxisSize: MainAxisSize.min,
            children: productController.allAttribute.value.map((e) =>Container(
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ExpansionTile(
                initiallyExpanded: true,
                collapsedBackgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide.none,
                ),
                collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide.none,
                ),
                backgroundColor: Colors.white,
                title: Text('${e.name}'),
                children: [
                  Obx(() => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ...(productAddController.selectedAttribute[e.name]??[]).map((a) => Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.green.withOpacity(.4)),
                          ),
                          Text(
                            a,
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: InkWell(
                              onTap: () {
                                List sizeListFormMap = productAddController.selectedAttribute[e.name]!??[];
                                sizeListFormMap.remove(a);
                                Set<dynamic> uniqueMapAttribute = Set<dynamic>.from(sizeListFormMap);
                                productAddController.selectedAttribute.value.remove(e.name);
                                var temp=productAddController.selectedAttribute.value;
                                temp.addAll({
                                  e.name!:uniqueMapAttribute.toList()
                                });
                                productAddController.selectedAttribute.value={};
                                productAddController.selectedAttribute.value=temp;
                                log("${productAddController.selectedAttribute}");
                                productAddController.generateCombinations(productAddController.pickColors.value.keys.toList(),productAddController.selectedAttribute.value);

                              },
                              child: const Text(
                                'Delete',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          )
                        ],
                      ))
                    ],
                  )),
                  TextButton(
                    style: TextButton.styleFrom(
                        side: const BorderSide(color: Colors.grey, width: .4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        )),
                    onPressed: () {
                      showSizePickerDialog(context, productAddController,e.name.toString());
                    },
                    child: Obx(() {
                      return Text(
                        productAddController.sizeList.value.isEmpty
                            ? 'Add ${e.name}'
                            : 'Add Another ${e.name}',
                        style: TextStyle(fontSize: 12),
                      );
                    }),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ) ).toList(),
          ))
          ,
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ExpansionTile(
              initiallyExpanded: true,
              collapsedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide.none,
              ),
              collapsedBackgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide.none,
              ),
              backgroundColor: Colors.white,
              title: Text('Color'),
              children: [
                Obx(() => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...productAddController.pickColors.value.entries
                            .map((MapEntry<String, dynamic> entry) => Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: Color(
                                              num.parse(entry.value).toInt())),
                                    ),
                                    Text(
                                      entry.key,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 16.0),
                                      child: InkWell(
                                        onTap: () {
                                          Map<String, dynamic> colorMap =
                                              productAddController
                                                  .pickColors.value;
                                          colorMap.remove(entry.key);
                                          productAddController
                                              .pickColors.value = {};
                                          productAddController
                                              .pickColors.value = colorMap;
                                          productAddController.generateCombinations(productAddController.pickColors.value.keys.toList(),productAddController.selectedAttribute.value);

                                        },
                                        child: Text(
                                          'Delete',
                                          style: TextStyle(
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ))
                      ],
                    )),
                TextButton(
                  style: TextButton.styleFrom(
                      fixedSize: Size.fromHeight(7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      side: BorderSide(color: Colors.grey, width: .4)),
                  onPressed: () async {
                    final Color newColor =
                        await showColorPickerDialog(context, Colors.red);
                    Map<String, dynamic> colorMap =
                        productAddController.pickColors.value;
                    colorMap.addAll({
                      ColorTools.materialName(newColor).split('[')[0]:
                          ColorTools.materialNameAndCode(newColor)
                              .split('(')[1]
                              .split(')')[0],
                    });
                    productAddController.pickColors.value = {};
                    productAddController.pickColors.value = colorMap;
                    log('${productAddController.pickColors}');
                    productAddController.generateCombinations(productAddController.pickColors.value.keys.toList(),productAddController.selectedAttribute.value);

                  },
                  child: Obx(() {
                    return Text(
                      productAddController.pickColors.value.isEmpty
                          ? 'Add Color'
                          : 'Add Another Color',
                      style: TextStyle(fontSize: 12),
                    );
                  }),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),

          ///variant Information
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
            child: Text(
              'Variant Product Information',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          Obx(() => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...productAddController.selectedVariant
                      .map((e) => ProductVariantItem(sku: e))
                ],
              )),
          SizedBox(height: 80)
        ],
      ),
    );
  }

  showSizePickerDialog(
      BuildContext context, ProductAddController productAddController, String name) {
    final _formKey = GlobalKey<FormBuilderState>();

    showDialog<String>(
      context: context,
      builder: (BuildContext context) => Dialog(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
        child: FormBuilder(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 13.0, vertical: 7),
                        child: FormBuilderTextField(
                          name: '${name}',
                          initialValue: '1',
                          decoration: InputDecoration(
                              labelText: '${name}',
                              prefixIcon:
                                  Icon(CupertinoIcons.selection_pin_in_out),
                              labelStyle: TextStyle(fontSize: 12)),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.numeric(),
                          ]),
                          autofillHints: const [AutofillHints.name],
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                        var sizeValue =
                            _formKey.currentState!.fields['${name}']?.value;
                        List sizeListFormMap = productAddController.selectedAttribute[name]??[];
                        sizeListFormMap.add(sizeValue);
                        Set<dynamic> uniqueMapAttribute = Set<dynamic>.from(sizeListFormMap);
                        productAddController.selectedAttribute.value.remove(name);
                        var temp=productAddController.selectedAttribute.value;
                        temp.addAll({
                          name:uniqueMapAttribute.toList()
                        });
                        productAddController.selectedAttribute.value={};
                        productAddController.selectedAttribute.value=temp;
                        log("${productAddController.selectedAttribute}");
                        productAddController.generateCombinations(productAddController.pickColors.value.keys.toList(),productAddController.selectedAttribute.value);
                        // selectedAttribute[name]! =
                        //     uniqueMapAttribute.toList();
                      },
                      child: Text('Add'),
                      style: ElevatedButton.styleFrom(
                        // backgroundColor: Theme.of(context).s,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  colorPicker(BuildContext context) {
    return showColorPickerDialog(
      context,
      Colors.red,
      width: 40,
      height: 40,
      spacing: 0,
      runSpacing: 0,
      borderRadius: 0,
      wheelDiameter: 165,
      enableOpacity: false,
      showColorCode: false,
      colorCodeHasColor: true,
      pickersEnabled: <ColorPickerType, bool>{
        ColorPickerType.custom: true,
      },
      actionButtons: const ColorPickerActionButtons(
        okButton: true,
        closeButton: true,
        dialogActionButtons: false,
      ),
      transitionBuilder: (BuildContext context, Animation<double> a1,
          Animation<double> a2, Widget widget) {
        final double curvedValue =
            Curves.easeInOutBack.transform(a1.value) - 1.0;
        return Transform(
          transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
          child: Opacity(
            opacity: a1.value,
            child: widget,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 400),
      constraints:
          const BoxConstraints(minHeight: 480, minWidth: 320, maxWidth: 320),
    );
  }
}
