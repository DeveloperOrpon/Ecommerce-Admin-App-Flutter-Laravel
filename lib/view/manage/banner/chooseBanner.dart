import 'package:ashique_admin_app/view/manage/banner/mainBanner.dart';
import 'package:ashique_admin_app/view/manage/banner/popupBanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../config/appConst.dart';

class ChooseBanner extends StatelessWidget {
  static const String routeName = 'chooseBanner';

  const ChooseBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                const SliverAppBar(
                  foregroundColor: Colors.white,
                  surfaceTintColor: Colors.white,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarBrightness: Brightness.dark,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  backgroundColor: Colors.white,
                  pinned: true,
                  floating: true,
                  title: Text(
                    'Choose Banner',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.normal),
                  ),
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                  Text(
                    "Which of the banner would you like to change",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    "Optimize your store with Banners, which allows you to choose between to or popup placement",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 12,
                    ),
                  ),
                ])),

                ///GRID
                SliverList(
                    delegate: SliverChildListDelegate([
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Get.to(const MainBanner(),
                          transition: Transition.rightToLeftWithFade);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 25, horizontal: 14),
                      height: 120,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Top Banner",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                "Choose top banners to showcase your product and ads to users",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 11,
                                ),
                              )
                            ],
                          )),
                          SizedBox(width: 10),
                          Container(
                            width: 80,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: .4,
                                )),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 80,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    height: 12,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(.7),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      'Top',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  height: 12,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Theme.of(context).primaryColor,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Get.to(const PopUpBanner(),
                          transition: Transition.rightToLeftWithFade);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 25, horizontal: 14),
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Popup Banner",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                "Choose popup banners to showcase your product and ads to users",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 11,
                                ),
                              )
                            ],
                          )),
                          SizedBox(width: 10),
                          Container(
                            width: 80,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.grey.shade400,
                                  width: .4,
                                )),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 80,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    height: 12,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade400,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: const Text(
                                      'PopUp',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  height: 12,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Colors.grey.shade400,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ])),
                SliverList(
                    delegate: SliverChildListDelegate([
                      SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Opacity(
                      opacity: .1,
                      child: Image.asset(
                        'assets/logo/leef.png',
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  )
                ]))
              ])),
    );
  }
}
