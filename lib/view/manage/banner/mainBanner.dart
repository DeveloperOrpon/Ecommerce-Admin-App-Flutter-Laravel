import 'package:ashique_admin_app/helper/helper.dart';
import 'package:ashique_admin_app/view/manage/banner/uploadBanner.dart';
import 'package:ashique_admin_app/view/widget/productSwitch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../config/api/api_route.dart';
import '../../../config/appConst.dart';
import '../../../config/refresh.dart';
import '../../../controller/bannerController.dart';
import '../../widget/networkImage.dart';

class MainBanner extends StatelessWidget {
  static const String routeName = 'mainBanner';

  const MainBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final bannerController = Get.put(BannerController());
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'Main Banner',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.normal),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(const UploadBanner(type: "Main Banner",),
              transition: Transition.rightToLeftWithFade);
        },
        label: Row(
          children: [
            Icon(Icons.add),
            const SizedBox(width: 5),
            Text('Add Banner ${bannerController.bannerList.length}'),
          ],
        ),
      ),
      backgroundColor: Theme
          .of(context)
          .scaffoldBackgroundColor,
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Obx(() {
            return SmartRefresher(
              physics: const BouncingScrollPhysics(),
              enablePullDown: true,
              enablePullUp: true,
              header: refreshLoading(context),
              footer: customFooter,
              controller: bannerController.refreshControllerBanner,
              onRefresh: bannerController.onRefreshBanner,
              onLoading: bannerController.onLoadingBanner,
              child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverList(
                        delegate: SliverChildListDelegate([
                          Text(
                            "Right Now Available Main Banners",
                            style: TextStyle(
                              color: Theme
                                  .of(context)
                                  .primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            "Those Banner are available website and app. Those Banner are has link for redirect page",
                            style: TextStyle(
                              color: Theme
                                  .of(context)
                                  .primaryColor,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 10),
                        ])),

                    ///Images
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                              (context, index) =>
                              Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    child: NetworkImagePreview(
                                      url: BANNER_IMAGE_URL +
                                          bannerController.mainList.value[index]
                                              .bannerImageUrl
                                              .toString(),
                                      height: 120,
                                      width: Get.width,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 6.0),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        deleteDialog(context, onTap: () {
                                          startLoading();
                                          bannerController.deleteBanner(
                                              bannerController.mainList
                                                  .value[index].id.toString())
                                              .then((value) {
                                            Get.back();
                                            showSuccessToastTop('Information',
                                                'Banner Deleted Successfully',
                                                context);
                                          }).catchError((onError) {
                                            showErrorToast('Warning',
                                                'Something Error Try Again ',
                                                context);
                                          });
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                          padding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          backgroundColor: Colors.red,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(4),
                                          )),
                                      child: const Text(
                                        'Remove',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 10,
                                    top: 10,
                                    child: CustomSwitch(
                                      value: bannerController.mainList
                                          .value[index].published ?? false,
                                      onTap: () {
                                        bannerController.updateStatus(
                                            bannerController.mainList.value[index]
                                                .id.toString(),
                                            !bannerController.mainList
                                                .value[index].published!);
                                      },
                                    ),
                                  )
                                ],
                              ),
                          childCount: bannerController.mainList.value.length),
                    ),
                    SliverList(
                        delegate: SliverChildListDelegate([
                          const SizedBox(
                            height: 50,
                          )
                        ]))
                  ]),
            );
          })),
    );
  }
}
