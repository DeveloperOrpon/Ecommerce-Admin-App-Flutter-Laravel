import 'dart:developer';

import 'package:ashique_admin_app/controller/BusinessSettingController.dart';
import 'package:ashique_admin_app/view/manage/Sellers/sellerDetails.dart';
import 'package:ashique_admin_app/view/manage/Sellers/sellerOrders.dart';
import 'package:ashique_admin_app/view/manage/Sellers/sellerProduct.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../config/appConst.dart';

class SellersScreen extends StatelessWidget {
  static const String routeName = 'SellersScreen';

  const SellersScreen({super.key});

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
                    'Sellers',
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
                  delegate: SliverChildListDelegate([
                    _sellerTitle(context),
                    _sellerTitle(context),
                    _sellerTitle(context),
                    _sellerTitle(context),
                    _sellerTitle(context),
                    _sellerTitle(context),
                  ]),
                )
              ])),
    );
  }

  Padding _sellerTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          Get.to(const SellerDetails(),
              transition: Transition.rightToLeftWithFade);
        },
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.black26,
                    width: .2,
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // User Photo
                      Container(
                          width: 40,
                          height: 40,
                          margin: EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: false
                              ? CachedNetworkImage(
                                  imageUrl: 'Url',
                                  fit: BoxFit.cover,
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          SpinKitPianoWave(
                                    color: Theme.of(context).primaryColor,
                                    size: 20.0,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const CircleAvatar(
                                    backgroundImage: AssetImage(appLogo),
                                  ),
                                  imageBuilder: (context, imageProvider) =>
                                      CircleAvatar(
                                    backgroundImage: imageProvider,
                                  ),
                                )
                              : TextAvatar(
                                  text: 'Orpon',
                                  size: 30,

                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                )),
                      // Username - Rating - Comments
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Username - Rating
                            Container(
                              margin: EdgeInsets.only(bottom: 4),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Mofizol Hasan| ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontFamily: 'poppins'),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4,
                                                      vertical: 1),
                                              decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              child: const Text(
                                                'Active',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 8,
                                                    height: 150 / 100),
                                              ),
                                            )
                                          ],
                                        ),
                                        Flexible(
                                          flex: 4,
                                          child: Text(
                                            'vandor@rushdasoft.com',
                                            style: TextStyle(
                                                color: Colors.orange[400],
                                                fontSize: 10,
                                                height: 150 / 100),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton.icon(
                        icon: Icon(
                          Icons.shopping_cart,
                          size: 20,
                        ),
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            side: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: .1,
                            )),
                        onPressed: () {
                          Get.to(const SellerOrders(),
                              transition: Transition.rightToLeftWithFade);
                        },
                        label: Text(
                          "Orders : 20",
                          style: TextStyle(
                              // fontWeight: FontWeight.w600,
                              color: Theme.of(context).primaryColor,
                              fontFamily: 'poppins'),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      OutlinedButton.icon(
                        icon: const Icon(
                          Icons.diamond_sharp,
                          size: 20,
                        ),
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            side: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: .1,
                            )),
                        onPressed: () {
                          Get.to(const SellerProducts(),
                              transition: Transition.rightToLeftWithFade);
                        },
                        label: Text(
                          "Products : 10",
                          style: TextStyle(
                              // fontWeight: FontWeight.w600,
                              color: Theme.of(context).primaryColor,
                              fontFamily: 'poppins'),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: const Text(
                'Details',
                style: TextStyle(
                    color: Colors.white, fontSize: 8, height: 150 / 100),
              ),
            )
          ],
        ),
      ),
    );
  }
}
