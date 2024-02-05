import 'package:ashique_admin_app/view/manage/deals/flashDeal/addFlashDeal.dart';
import 'package:ashique_admin_app/view/manage/deals/flashDeal/addProductFlashDeal.dart';
import 'package:ashique_admin_app/view/widget/productSwitch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'addDealOfTheDay.dart';

class DealsOfTheDay extends StatelessWidget {
  const DealsOfTheDay({super.key});

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
          'Deals Of The Day',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              Get.to(const AddDealOfTheDay(),
                  transition: Transition.rightToLeftWithFade);
            },
            label: const Text("Add"),
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                _flashTitle(context, 1),
                _flashTitle(context, 2),
                _flashTitle(context, 3),
                _flashTitle(context, 4),
                _flashTitle(context, 4),
                _flashTitle(context, 4),
                _flashTitle(context, 4),
              ]),
            )
          ],
        ),
      ),
    );
  }

  _flashTitle(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(.3),
          width: .3,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 130,
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                child: Image.asset(
                  'assets/logo/banner.jpg',
                  height: 120,
                  width: Get.width * .3,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 120,
                width: Get.width * .3,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.3)
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit,color: Colors.white,),
                ),
              )
            ],
          ),
          SizedBox(width: 10),
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Deal of The Day',
                    maxLines: 1,
                    style: GoogleFonts.fraunces(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    maxLines: 2,
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                    "Iphone 15 Pro Max Black 256GB Singular Variant 2025",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    maxLines: 2,
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                    "BDT 10,000",
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Row(
                    children: [
                      CustomSwitch(),
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
