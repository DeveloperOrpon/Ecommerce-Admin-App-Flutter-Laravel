import 'package:ashique_admin_app/config/api/api_route.dart';
import 'package:ashique_admin_app/config/appConst.dart';
import 'package:ashique_admin_app/controller/brandController.dart';
import 'package:ashique_admin_app/view/manage/brand/addBrand.dart';
import 'package:ashique_admin_app/view/manage/customer/model/dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../config/refresh.dart';
import '../../../helper/helper.dart';
import '../../order/OrderTile.dart';

class BrandScreen extends StatelessWidget {
  static const String routeName = 'BrandScreen';

  const BrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    final brandController = Get.put(BrandController());
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
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
          'Brand',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              Get.to(const AddBrand(), transition: Transition.fadeIn);
            },
            icon: const Icon(CupertinoIcons.add),
            label: const Text("Add"),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
        child: Obx(() {
          return SmartRefresher(
            physics: const BouncingScrollPhysics(),
            enablePullDown: true,
            enablePullUp: true,
            header: refreshLoading(context),
            footer: customFooter,
            controller: brandController.refreshController,
            onRefresh: brandController.onRefresh,
            onLoading: brandController.onLoading,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final brand = brandController.allBrand.value[index];
                      return Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: .2,
                              )),
                          tileColor: Colors.white,
                          style: ListTileStyle.drawer,
                          leading: CachedNetworkImage(
                              imageUrl: "${BRAND_IMAGE_URL}${brand.image}",
                              placeholder: (context, url) => const CircleAvatar(
                                    radius: 30,
                                    child: CupertinoActivityIndicator(),
                                  ),
                              errorWidget: (context, url, error) =>
                                  const CircleAvatar(
                                    radius: 30,
                                    child: Icon(Icons.error),
                                  ),
                              imageBuilder: (context, imageProvider) {
                                return CircleAvatar(
                                  radius: 30,
                                  backgroundImage: imageProvider,
                                );
                              }),
                          title: Row(
                            children: [
                              Text(
                                '${brand.name}',
                                style: GoogleFonts.gabriela(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                padding: const EdgeInsetsDirectional.symmetric(
                                    horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(.2),
                                ),
                                child: Text(
                                  '${brand.brandProductsCount} Items',
                                  style: GoogleFonts.fraunces(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 8),
                                ),
                              )
                            ],
                          ),
                          subtitle: Text(
                            '#Id ${brand.id}',
                            style: GoogleFonts.robotoMono(fontSize: 10),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                  onTap: () {
                                    Get.to(
                                        AddBrand(
                                          brand: brand,
                                        ),
                                        transition:
                                            Transition.rightToLeftWithFade);
                                  },
                                  child: const Icon(
                                    Icons.edit,
                                    color: Colors.green,
                                  )),
                              Container(
                                margin: EdgeInsetsDirectional.symmetric(
                                    horizontal: 10),
                                height: 30,
                                width: 2,
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(.2),
                              ),
                              InkWell(
                                  onTap: () {
                                    showCupertinoModalPopup<void>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                         CupertinoAlertDialog(
                                          title: const Text('Information'),
                                          content: Text(  'Are You Sure Want to delete this brand \n ${brand.name}'),
                                          actions: <Widget>[
                                            CupertinoDialogAction(
                                              onPressed: () {
                                                Get.back();
                                                startLoading();
                                                brandController
                                                    .deleteBrand(id: brand!.id.toString())
                                                    .then((value) {

                                                  Get.back();
                                                }).catchError((onError) {

                                                  Get.back();
                                                  showErrorToast('Warning',
                                                      'Band Update Error Try Again', context);
                                                });

                                              },
                                              child: const Text('Yes'),
                                            ),
                                            CupertinoDialogAction(
                                              isDefaultAction: true,
                                              isDestructiveAction: true,
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('No'),
                                            ),
                                          ],
                                        )
                                    );
                                  },
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  )),
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: brandController.allBrand.value.length,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
