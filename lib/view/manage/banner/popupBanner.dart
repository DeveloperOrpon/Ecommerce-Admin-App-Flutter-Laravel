import 'package:ashique_admin_app/view/manage/banner/uploadBanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../config/appConst.dart';

class PopUpBanner extends StatelessWidget {
  static const String routeName = 'popupBanner';

  const PopUpBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(const UploadBanner(),transition: Transition.rightToLeftWithFade);
        },
        label: const Row(
          children: [
            Icon(Icons.add),
            SizedBox(width: 5),
            Text('Add Banner'),
          ],
        ),
      ),
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
                    'Popup Banner',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.normal),
                  ),
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                  Text(
                    "Right Now Available Popup Banners",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    "Those Banner are available website and app. Those Banner are has link for redirect page",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 10),
                ])),

                ///Images
                SliverList(
                  delegate: SliverChildListDelegate([
                    Row(
                      children: [
                        Expanded(
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                child: Image.asset(
                                  'assets/logo/banner.jpg',
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 6.0),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text('Remove',style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12
                                  ),),
                                  style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(horizontal: 8),
                                      backgroundColor: Colors.red,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      )
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                child: Image.asset(
                                  'assets/logo/banner.jpg',
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 6.0),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text('Remove',style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12
                                  ),),
                                  style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(horizontal: 8),
                                      backgroundColor: Colors.red,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      )
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                child: Image.asset(
                                  'assets/logo/banner.jpg',
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 6.0),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text('Remove',style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12
                                  ),),
                                  style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(horizontal: 8),
                                      backgroundColor: Colors.red,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      )
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                child: Image.asset(
                                  'assets/logo/banner.jpg',
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 6.0),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text('Remove',style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12
                                  ),),
                                  style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(horizontal: 8),
                                      backgroundColor: Colors.red,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      )
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ]),
                ),
              ])),
    );
  }
}
