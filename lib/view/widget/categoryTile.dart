import 'package:ashique_admin_app/config/appConst.dart';
import 'package:ashique_admin_app/helper/helper.dart';
import 'package:ashique_admin_app/model/Category.dart';
import 'package:ashique_admin_app/view/widget/productSwitch.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_menu/expandable_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as DIO;
import '../../config/api/api_route.dart';
import '../../config/textStyle.dart';
import '../../controller/productController.dart';
import '../dashboard/category/addCategory.dart';

class CategoryTile extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoryTile(this.categoryModel, {super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());
    return Container(
      height: 130,
      padding: const EdgeInsets.all(6),
      margin: const EdgeInsets.only(left: 12, right: 12, bottom: 5),
      decoration: BoxDecoration(
          color:categoryModel.active!? Colors.white:Colors.red.withOpacity(.05),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color:categoryModel.active!? Theme.of(context).primaryColor.withOpacity(.4):Colors.red,
            width: categoryModel.active!? .4:1,
          )),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomRight,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 75,
                    width: 90,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: CachedNetworkImage(
                      imageUrl: "$CATEGORY_IMAGE_URL${categoryModel.icon}",
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              const CupertinoActivityIndicator(),
                      errorWidget: (context, url, error) =>
                          Image.asset(appLogo),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Text("${categoryModel.name}",
                                  style: productTextStyle)),
                        ],
                      ),
                      Text(
                        "${categoryModel.count} Items Listed",
                        style: productTextStyle,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Text(
                                  categoryModel.active!
                                      ? 'Active'
                                      : 'In-Active',
                                  style: productTextStyle.copyWith(
                                      color:categoryModel.active!? Colors.green:Colors.red,
                                      fontWeight: FontWeight.bold))),
                        ],
                      ),
                    ],
                  ))
                ],
              ),
              CustomSwitch(
                value: categoryModel.active ?? false,
                onTap: () {
                  startLoading();
                  productController
                      .updateCategory(
                          categoryModel.id.toString(),
                          DIO.FormData.fromMap(
                              {'active': !categoryModel.active! ? 1 : 0}))
                      .then((value) {
                    Get.back();
                  });
                },
              ),
              Positioned(
                  top: -12.0,
                  left: 0.0,
                  right: -8.0,
                  child: Row(
                    children: [
                      const Spacer(),
                      Expanded(
                        child: ExpandableMenu(
                          width: 40.0,
                          height: 40.0,
                          backgroundColor: Colors.transparent,
                          iconColor: Theme.of(context).primaryColor,
                          itemContainerColor: Theme.of(context).primaryColor,
                          items: [
                            InkWell(
                              onTap: () {
                                deleteDialog(context, onTap: () {
                                  startLoading();
                                  productController
                                      .deleteCategory(
                                          categoryModel.id.toString())
                                      .then((value) {
                                    Get.back();
                                    if (!value) {
                                      showErrorToast('Warning',
                                          'Something Error Try Again', context);
                                    } else {}
                                  });
                                });
                              },
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(AddCategory(categoryModel: categoryModel,), transition: Transition.fadeIn);
                              },
                              child: const Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
          Expanded(
              child: Column(
            children: [
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.share, color: Theme.of(context).primaryColor),
                  const SizedBox(width: 6),
                  const Text("Share Category")
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
