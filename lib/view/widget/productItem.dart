import 'package:ashique_admin_app/config/appConst.dart';
import 'package:ashique_admin_app/view/widget/productSwitch.dart';
import 'package:expandable_menu/expandable_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:load_switch/load_switch.dart';
import 'package:super_context_menu/super_context_menu.dart';

import '../../config/textStyle.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(left: 12, right: 12, bottom: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(.4),
          width: .4,
        )
      ),
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
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(8)),
                    child: Image.asset(
                      appLogo,
                      width: 100,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Text("Long T-shirt For Man",
                                  style: productTextStyle)),
                        ],
                      ),
                      Text(
                        "1 Piece",
                        style: productTextStyle,
                      ),
                      Text("\$ 6000",
                          style: productTextStyle.copyWith(
                              color: Theme.of(context).primaryColor)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Text("In Stock",
                                  style: productTextStyle.copyWith(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold))),
                        ],
                      ),
                    ],
                  ))
                ],
              ),
              const ProductSwitch(),
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
                          items: [
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
                  SizedBox(width: 6),
                  Text("Share Product")
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
