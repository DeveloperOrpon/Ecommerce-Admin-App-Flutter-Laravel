import 'dart:developer';

import 'package:ashique_admin_app/controller/BusinessSettingController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BusinessSettings extends StatelessWidget {
  static const String routeName = 'BusinessSettings';

  const BusinessSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final businessSettingController = Get.put(BusinessSettingController());
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
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
                    'Business Settings',
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
                        (context, index) => manageTitle(
                            businessSettingController, context, index),
                        childCount:
                            businessSettingController.busisnessGrid.length))
              ])),
    );
  }

  manageTitle(BusinessSettingController businessSettingController,
      BuildContext context, int index,
      {bool isCheck = false}) {
    return InkWell(
      onTap: () {
        log("${businessSettingController.busisnessGrid[index].values.elementAt(1)}");
        Get.toNamed(
          businessSettingController.busisnessGrid[index].values.elementAt(2),
        );
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
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 4, right: 4, left: 4, bottom: 7),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
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
                        businessSettingController
                            .busisnessGrid[index].values.first,
                        size: 30,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                businessSettingController.busisnessGrid[index].keys.first,
                style: GoogleFonts.alef(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                  fontSize: 16,
                ),
              ),
              Text(
                businessSettingController.busisnessGrid[index].values
                    .elementAt(1),
                style: GoogleFonts.aBeeZee(
                  fontSize: 10,
                  color: Colors.black54,
                ),
              ),
            ],
          )),
          const SizedBox(width: 6),
        Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Theme.of(context).primaryColor.withOpacity(.3),
                ),
          SizedBox(width: 6),
        ],
      ),
    );
  }
}
