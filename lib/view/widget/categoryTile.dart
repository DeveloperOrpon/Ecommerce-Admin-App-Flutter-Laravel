import 'package:ashique_admin_app/config/appConst.dart';
import 'package:ashique_admin_app/model/Category.dart';
import 'package:ashique_admin_app/view/widget/productSwitch.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_menu/expandable_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/api/api_route.dart';
import '../../config/textStyle.dart';

class CategoryTile extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoryTile(this.categoryModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      padding: const EdgeInsets.all(6),
      margin: const EdgeInsets.only(left: 12, right: 12, bottom: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Theme.of(context).primaryColor.withOpacity(.4),
            width: .4,
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
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold))),
                        ],
                      ),
                    ],
                  ))
                ],
              ),
              CustomSwitch(value: categoryModel.active ?? false),
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
                          items: const [
                            Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.edit,
                              color: Colors.white,
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
