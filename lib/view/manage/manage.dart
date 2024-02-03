import 'dart:developer';

import 'package:ashique_admin_app/controller/homeController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../order/PlacedOrder/shippingMethod.dart';

class ManageContent extends StatelessWidget {
  const ManageContent({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: CustomScrollView(
        slivers: [
          const SliverAppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
            ),
            pinned: true,
            floating: true,
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text(
              'Manage',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
            actions: [
              // IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.search))
            ],
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) =>
                      manageTitle(homeController, context, index),
                  childCount: homeController.manageGrid.length))
        ],
      ),
    );
  }
}

manageTitle(HomeController homeController, BuildContext context, int index,
    {bool isCheck = false}) {
  return InkWell(
    onTap: () {
      log("${homeController.manageGrid[index].values.elementAt(1)}");
      Get.toNamed(homeController.manageGrid[index].values.elementAt(2),);
    },
    child: Row(
      children: [
        SizedBox(
          height: 75,
          width: 75,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 4, right: 4, left: 4, bottom: 7),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    border: Border.all(color: Colors.black26, width: .3)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      homeController.manageGrid[index].values.first,
                      size: 30,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(width: 5),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              homeController.manageGrid[index].keys.first,
              style: GoogleFonts.alef(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
                fontSize: 16,
              ),
            ),
            Text(
              homeController.manageGrid[index].values.elementAt(1),
              style: GoogleFonts.aBeeZee(
                fontSize: 10,
                color: Colors.black54,
              ),
            ),
          ],
        )),
        SizedBox(width: 6),
        isCheck
            ? const Icon(
                CupertinoIcons.checkmark_alt,
                color: Colors.green,
              )
            : Icon(
                Icons.arrow_forward_ios_rounded,
                color: Theme.of(context).primaryColor.withOpacity(.3),
              ),
        SizedBox(width: 6),
      ],
    ),
  );
}
