import 'package:ashique_admin_app/view/manage/banner/uploadBanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../config/api/api_route.dart';
import '../../../config/appConst.dart';
import '../../../config/refresh.dart';
import '../../../controller/bannerController.dart';
import '../../../helper/helper.dart';
import '../../widget/networkImage.dart';
import '../../widget/productSwitch.dart';

class PopUpBanner extends StatelessWidget {
  static const String routeName = 'popupBanner';

  const PopUpBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final bannerController = Get.put(BannerController());
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
        title: const Text(
          'Popup Banner',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.normal),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(const UploadBanner(type: "Popup Banner",),
              transition: Transition.rightToLeftWithFade);
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
                      SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                              childCount: bannerController.popUpList.value.length,
                              (context, index) => Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        child: NetworkImagePreview(
                                          url: BANNER_IMAGE_URL +
                                              bannerController.popUpList.value[index]
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
                                                  bannerController.popUpList
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
                                                  const EdgeInsets.symmetric(horizontal: 8),
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
                                          value: bannerController.popUpList
                                              .value[index].published ?? false,
                                          onTap: () {
                                            bannerController.updateStatus(
                                                bannerController.popUpList.value[index]
                                                    .id.toString(),
                                                !bannerController.popUpList
                                                    .value[index].published!);
                                          },
                                        ),
                                      )
                                    ],
                                  )),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                                childAspectRatio: 1.4
                          )),
                    ]),
              );
            }
          )),
    );
  }
}
