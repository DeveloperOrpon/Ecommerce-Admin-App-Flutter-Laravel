import 'package:ashique_admin_app/config/appConst.dart';
import 'package:ashique_admin_app/config/refresh.dart';
import 'package:ashique_admin_app/controller/couponController.dart';
import 'package:ashique_admin_app/controller/paymentController.dart';
import 'package:ashique_admin_app/model/couponRes.dart';
import 'package:ashique_admin_app/view/widget/productSwitch.dart';
import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'createCoupon.dart';

class CouponScreen extends StatelessWidget {
  static const String routeName = 'CouponScreen';

  const CouponScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final couponController = Get.put(CouponController());
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
          'Discount Coupon',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              Get.to(const CreateCoupon(),
                  transition: Transition.rightToLeftWithFade);
            },
            icon: const Icon(CupertinoIcons.add),
            label: const Text('Create'),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Obx(() {
          return SmartRefresher(
            physics: const BouncingScrollPhysics(),
            enablePullDown: true,
            enablePullUp: true,
            header: refreshLoading(context),
            footer: customFooter,
            controller: couponController.refreshController,
            onRefresh: couponController.onRefresh,
            onLoading: couponController.onLoading,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverList(
                    delegate: SliverChildListDelegate([
                  if (couponController.coupons.isEmpty)
                    const SizedBox(height: 30),
                  if (couponController.coupons.isEmpty)
                    Image.asset(
                      couponImage,
                      height: Get.height * .3,
                      colorBlendMode: BlendMode.colorDodge,
                      // color: Theme.of(context).primaryColor,
                    ),
                  // couponWidget(),
                  const SizedBox(height: 25),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                    child: Row(
                      children: [
                        const CircleAvatar(radius: 8),
                        SizedBox(width: 5),
                        Text(
                          "Available Discount Coupon",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            // fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ])),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (context, index) => couponWidget(context,couponController.coupons.value[index]),
                        childCount: couponController.coupons.length)),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget couponWidget(BuildContext context, CouponModel couponModel) {
    Color primaryColor = Theme.of(context).primaryColor.withOpacity(.1);
    Color secondaryColor =  Theme.of(context).primaryColor.withOpacity(.8);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: CouponCard(
        height: 100,
        backgroundColor: primaryColor,
        clockwise: true,
        curvePosition: 100,
        curveRadius: 30,
        curveAxis: Axis.vertical,
        borderRadius: 5,
        firstChild: Container(
          decoration: BoxDecoration(
            color: secondaryColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        couponModel.discountType=='amount'?"${num.parse(couponModel.amount??"0").toInt()}$currency OFF":'${num.parse(couponModel.amount??"0").toInt()}% OFF',
                        style: GoogleFonts.josefinSans(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(color: Colors.white54, height: 0),
              Expanded(
                child: Center(
                  child: Text(
                    'Discount on ${couponModel.discountType}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
        ),
        secondChild: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Coupon Code',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      '${couponModel.code}',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.aBeeZee(
                        fontSize: 20,
                        color: secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                     Text(
                      'Valid Till - ${couponModel.dateExpires}',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black45, fontSize: 10),
                    ),
                  ],
                ),
              ),
               Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomSwitch(value: couponModel.status=="published"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DolDurmaClipper extends CustomClipper<Path> {
  final double holeRadius;

  DolDurmaClipper({required this.holeRadius});

  @override
  Path getClip(Size size) {
    final path = Path();
    final double space = 20.0; // Space between hole and card edge

    // Top-left corner
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    // Top-right corner
    path.lineTo(0, size.height);
    path.lineTo(0, 0);

    // Hole in the middle
    double holeCenterX = size.width / 2;
    double holeCenterY = size.height / 2;
    path.addOval(
      Rect.fromCircle(
        center: Offset(holeCenterX, holeCenterY),
        radius: holeRadius,
      ),
    );

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
