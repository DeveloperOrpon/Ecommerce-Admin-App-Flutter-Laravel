import 'package:ashique_admin_app/config/appConst.dart';
import 'package:ashique_admin_app/view/order/PlacedOrder/discount.dart';
import 'package:ashique_admin_app/view/order/PlacedOrder/paymentMethod.dart';
import 'package:ashique_admin_app/view/order/PlacedOrder/selectCustomer.dart';
import 'package:ashique_admin_app/view/order/PlacedOrder/selectProduct.dart';
import 'package:ashique_admin_app/view/order/PlacedOrder/shippingMethod.dart';
import 'package:ashique_admin_app/view/widget/divider.dart';
import 'package:ashique_admin_app/view/widget/productQtyUi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pull_down_button/pull_down_button.dart';

import 'note.dart';

class PlaceOrder extends StatelessWidget {
  const PlaceOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    elevation: 0,
                    pinned: true,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.white,
                    surfaceTintColor: Colors.white,
                    systemOverlayStyle: const SystemUiOverlayStyle(
                      statusBarBrightness: Brightness.dark,
                      statusBarIconBrightness: Brightness.dark,
                    ),
                    title: const Text(
                      'New Order',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.normal),
                    ),
                    leading: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          CupertinoIcons.xmark,
                          color: Colors.black,
                        )),
                    actions: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SliverList(
                      delegate: SliverChildListDelegate([
                    ListTile(
                      onTap: () {
                        Get.to(SelectCustomer(),
                            transition: Transition.rightToLeftWithFade);
                      },
                      leading: Icon(
                        Icons.person,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: const Text(
                        "Customer",
                        style: TextStyle(fontSize: 17),
                      ),
                      trailing: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Anonymous"),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.grey,
                            size: 16,
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 10,
                      color: Colors.grey.shade100,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.shopping_bag,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: const Text("Order Items",
                          style: TextStyle(fontSize: 17)),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          PullDownButton(
                            itemBuilder: (context) => [
                              PullDownMenuItem(
                                onTap: () {},
                                title: 'Delete All items',
                                isDestructive: true,
                                icon: CupertinoIcons.delete,
                                iconColor: Colors.red,
                              ),
                            ],
                            buttonBuilder: (context, showMenu) =>
                                CupertinoButton(
                              onPressed: showMenu,
                              padding: EdgeInsets.zero,
                              child: const Icon(
                                Icons.more_vert,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Get.to(const SelectProduct(),
                                  transition: Transition.rightToLeftWithFade);
                            },
                            icon: Icon(
                              Icons.add,
                              color: Theme.of(context).primaryColor,
                              size: 22,
                            ),
                          )
                        ],
                      ),
                    ),
                    _productTile(context),
                    _productTile(context),
                    _productTile(context),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: Colors.grey.shade200,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  )),
                              onPressed: () {
                                Get.to(const SelectProduct(),
                                    transition: Transition.rightToLeftWithFade);
                              },
                              label: Text('Add'),
                              icon: Icon(CupertinoIcons.add),
                            ),
                          )
                        ],
                      ),
                    ),
                    const CustomDivider(),
                  ])),
                  SliverList(
                      delegate: SliverChildListDelegate([
                    ListTile(
                      onTap: () {
                        Get.to(const ShippingMethod(),
                            transition: Transition.rightToLeftWithFade);
                      },
                      leading: Icon(
                        Icons.motorcycle,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: const Text(
                        "Shipping Method",
                        style: TextStyle(fontSize: 15),
                      ),
                      trailing: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Optional",
                            style: TextStyle(
                              fontSize: 11,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.grey,
                            size: 14,
                          )
                        ],
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Get.to(const PaymentMethod(),
                            transition: Transition.rightToLeftWithFade);
                      },
                      leading: Icon(
                        FontAwesomeIcons.ccVisa,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: const Text(
                        "Payment Method",
                        style: TextStyle(fontSize: 15),
                      ),
                      trailing: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Optional",
                            style: TextStyle(
                              fontSize: 11,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.grey,
                            size: 14,
                          )
                        ],
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Get.to(const Discount(),
                            transition: Transition.rightToLeftWithFade);
                      },
                      leading: Icon(
                        Icons.discount,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: const Text(
                        "Discount",
                        style: TextStyle(fontSize: 15),
                      ),
                      trailing: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Optional",
                            style: TextStyle(
                              fontSize: 11,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.grey,
                            size: 14,
                          )
                        ],
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Get.to(Note(),
                            transition: Transition.rightToLeftWithFade);
                      },
                      leading: Icon(
                        Icons.note,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: const Text(
                        "Note",
                        style: TextStyle(fontSize: 15),
                      ),
                      trailing: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Optional",
                            style: TextStyle(
                              fontSize: 11,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.grey,
                            size: 13,
                          )
                        ],
                      ),
                    ),
                    const CustomDivider(),
                    ListTile(
                      leading: Icon(
                        Icons.price_change_rounded,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: Text(
                        "Order details",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Product Total Price",
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            "BDT 8,0000",
                            style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total Discount",
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            "BDT 8,0000",
                            style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ]))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              decoration: BoxDecoration(
                color: CupertinoColors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total (4)',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Text(
                    'BDT 1,200.00  ',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _productTile(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          height: 80,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: .1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Image.asset(
                appLogo,
                width: 80,
                height: 80,
              ),
              SizedBox(width: 10),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing ',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 25,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          'SKU: RED_XL_50CM',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'BDT 150.00',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: ProductQtyUi(),
        )
      ],
    );
  }
}
