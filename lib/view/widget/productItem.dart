import 'package:ashique_admin_app/config/api/api_route.dart';
import 'package:ashique_admin_app/view/dashboard/products/productDetails.dart';
import 'package:ashique_admin_app/view/widget/networkImage.dart';
import 'package:ashique_admin_app/view/widget/productSwitch.dart';
import 'package:expandable_menu/expandable_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/textStyle.dart';
import '../../model/productRes.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  const ProductItem(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(ProductDetails(product), transition: Transition.fadeIn);
      },
      child: Container(
        height: 142,
        padding: const EdgeInsets.all(8),
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
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(8)),
                      child: NetworkImagePreview(
                        url: PRODUCT_THUMBMAIL_IMAGE_URL +
                            (product.thumbnail ?? ""),
                        width: 100,
                        height: 80,
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
                                child: Text("${product.name}",
                                    maxLines: 2,

                                    overflow: TextOverflow.ellipsis,
                                    style: productTextStyle.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ))),
                          ],
                        ),
                        Text(
                          "${product.currentStock} Piece",
                          style: productTextStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                        Text("\$ ${product.price}",
                            style: productTextStyle.copyWith(
                                color: Theme.of(context).primaryColor)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Text("${product.stockStatus}",
                                    style: productTextStyle.copyWith(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold))),
                          ],
                        ),
                      ],
                    ))
                  ],
                ),
                const CustomSwitch(),
                Positioned(
                    top: -12.0,
                    left: 0.0,
                    right: -8.0,
                    child: Row(
                      children: [
                        Spacer(),
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
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.share, color: Theme.of(context).primaryColor),
                    const SizedBox(width: 6),
                    Text("Share Product")
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
