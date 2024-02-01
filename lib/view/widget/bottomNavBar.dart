import 'package:ashique_admin_app/controller/homeController.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/tab_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<TabItem> items = [
  const TabItem(
    icon: CupertinoIcons.house_alt,
    title: 'Home',
  ),
  const TabItem(
    icon: CupertinoIcons.doc_plaintext,
    title: 'Orders',
  ),
  const TabItem(
    icon: Icons.category,
    title: 'Products',
  ),
  const TabItem(
    icon: Icons.manage_accounts,
    title: 'Manage',
  ),
  const TabItem(
    icon: CupertinoIcons.person_fill,
    title: 'profile',
  ),
];

class BottomWidget extends StatelessWidget {
  const BottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 8, right: 8),
      child: Obx(() {
        return BottomBarFloating(
          enableShadow: true,
          bottom: 8,
          countStyle: const CountStyle(color: Colors.red),
          items: items,
          backgroundColor: Theme.of(context).primaryColor,
          color: Colors.white,
          colorSelected: Colors.orange,
          indexSelected: homeController.homePageIndex.value,
          animated: true,
          curve: Curves.bounceInOut,
          top: 7,
          pad: 5,
          iconSize: 19,
          titleStyle: TextStyle(fontSize: 9),
          borderRadius: BorderRadius.circular(30),
          paddingVertical: 10,
          onTap: (int index) {
            // homeController.pageController.animateToPage(index,
            //     duration: Duration(milliseconds: 200),
            //     curve: Curves.linearToEaseOut);
            // homeController.homePageIndex.value=index;
          },
        );
      }),
    );
  }
}
