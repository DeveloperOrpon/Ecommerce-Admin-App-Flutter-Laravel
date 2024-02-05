import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dealOfTheDay/dealOfTheDay.dart';
import 'featureDeal/featureDeal.dart';
import 'flashDeal/flashDeal.dart';

class AllDeals extends StatelessWidget {
  static const String routeName = 'AllDeals';

  const AllDeals({super.key});

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
          'All Deals',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              _dealTile(
                  context, "assets/images/flash.png", 'Flash Deal', () {
                    Get.to(const FlashDeals(),transition: Transition.rightToLeftWithFade);
              },1),
              _dealTile(context, "assets/images/dealOfTheDay.png",
                  'Deal Of The Day', () {
                    Get.to(const DealsOfTheDay(),transition: Transition.rightToLeftWithFade);
                  },2),
              _dealTile(context, "assets/images/FeatureDeal.jpg",
                  'Feature Deal', () {
                    Get.to(const FeatureDeals(),transition: Transition.rightToLeftWithFade);
                  },3),
            ]))
          ],
        ),
      ),
    );
  }

  _dealTile(
      BuildContext context, String image, String title, Function() onTap,int index) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
            height: Get.height * .18,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: .5,
                )),
            child: Image.asset(
              image,
              height: Get.height * .18,
              width: Get.width * .8,
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 42,
            width: Get.width * .8,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(.7),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Text(
              title,
              style: GoogleFonts.sofia(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                color: Colors.white,
              ),
            ),
          )
        ],
      ).animate().flipV(delay: (180*index).ms),
    );
  }
}
