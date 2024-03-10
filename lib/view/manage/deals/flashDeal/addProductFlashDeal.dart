import 'dart:developer';

import 'package:ashique_admin_app/config/api/api_route.dart';
import 'package:ashique_admin_app/controller/dealController.dart';
import 'package:ashique_admin_app/helper/helper.dart';
import 'package:ashique_admin_app/model/ProductRes.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../../config/appConst.dart';
import '../../../../config/textStyle.dart';
import '../../../../model/flashDealProductRes.dart';
import '../../../widget/networkImage.dart';

class AddProductFlashDeal extends StatefulWidget {
  final String id;

  const AddProductFlashDeal({super.key, required this.id});

  @override
  State<AddProductFlashDeal> createState() => _AddProductFlashDealState();
}

class _AddProductFlashDealState extends State<AddProductFlashDeal> {
  final dealController = Get.put(DealController());
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getDealProduct();
  }

  List<FlashProductModel> productList = [];

  getDealProduct() {
    isLoading = true;
    dealController.getFlashDealProduct(widget.id, "1").then((value) {
      setState(() {
        productList.addAll(value);
        Future.delayed(
          Duration(seconds: 1),
          () {
            setState(() {
              isLoading = false;
            });
          },
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
        title: const Text(
          'Add Product In FlashDeal',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() {
              return ElevatedButton(
                onPressed: dealController.selectedFlashProduct.value.isEmpty
                    ? null
                    : () {
                        startLoading();
                        dealController
                            .addFlashDealProduct(widget.id)
                            .then((value) {
                          Get.back();
                          productList = [];
                          getDealProduct();
                        });
                      },
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).primaryColor.withOpacity(.8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    )),
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              );
            }),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            if (!isLoading)
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownSearch<FlashProductModel>.multiSelection(
                        itemAsString: (item) => item.name.toString(),
                        asyncItems: (filter) => getData(filter),
                        onChanged: (value) {
                          log("${value.length}");
                          dealController.selectedFlashProduct.value = value;
                        },
                        dropdownBuilder: _customDropDownExampleMultiSelection,
                        popupProps: PopupPropsMultiSelection.dialog(
                          showSearchBox: true,
                          itemBuilder: (context, item, isSelected) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: !isSelected
                                ? null
                                : BoxDecoration(
                                    border: Border.all(
                                        color: Theme.of(context).primaryColor),
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.white,
                                  ),
                            child: ListTile(
                              selected: isSelected,
                              title: Text(
                                maxLines: 2,
                                item.name.toString(),
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(
                                "${item.unitPrice.toString()} $currency",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                              leading: NetworkImagePreview(
                                url: PRODUCT_THUMBMAIL_IMAGE_URL +
                                    (item.thumbnail ?? ""),
                                width: 60,
                                height: 60,
                              ),
                            ),
                          ),
                          favoriteItemProps: FavoriteItemProps(
                            showFavoriteItems: true,
                            favoriteItemBuilder: (context, item, isSelected) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 6),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[100]),
                                child: Row(
                                  children: [
                                    Text(
                                      "${item.unitPrice}",
                                      textAlign: TextAlign.center,
                                      style:
                                          const TextStyle(color: Colors.indigo),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(left: 8)),
                                    isSelected
                                        ? const Icon(Icons.check_box_outlined)
                                        : const SizedBox.shrink(),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ).animate().slideY(),
          ])),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) => selectedProductTile(
              context,
              productList[index],
              onTap:(){
                dealController.deleteFlashDealProduct(productList[index].id.toString()).then((value){
                  productList=[];
                  getDealProduct();
                });
              }
            ),
            childCount: productList.length,
          ))
        ],
      ),
    );
  }

  Future<List<FlashProductModel>> getData(filter) async {
    return await dealController.searchFlashDealProduct(filter);
  }

  Widget _customDropDownExampleMultiSelection(
      BuildContext context, List<FlashProductModel> selectedItems) {
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
            url: PRODUCT_THUMBMAIL_IMAGE_URL + (e.thumbnail ?? ""),
            width: 60,
            height: 60,
          ),
        );
      }).toList(),
    );
  }
}

selectedProductTile(BuildContext context, FlashProductModel productModel,
    {bool isShowDeleteButton = true, Function? onTap}) {
  final dealController = Get.put(DealController());
  return Container(
    height: 80,
    padding: EdgeInsets.all(6),
    margin: EdgeInsets.all(6),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: Colors.grey.shade200,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Row(
      children: [
        NetworkImagePreview(
          url: PRODUCT_THUMBMAIL_IMAGE_URL + productModel.thumbnail.toString(),
          width: 100,
          height: 80,
        ),
        const SizedBox(width: 10),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              maxLines: 1,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
              "${productModel.name}",
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              maxLines: 1,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
              "${productModel.unitPrice} $currency",
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )),
        if (isShowDeleteButton)
          InkWell(
            onTap: () {
              onTap!();
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          )
      ],
    ),
  );
}
