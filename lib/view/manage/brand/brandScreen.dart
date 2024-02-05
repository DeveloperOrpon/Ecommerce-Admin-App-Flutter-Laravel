import 'package:ashique_admin_app/config/appConst.dart';
import 'package:ashique_admin_app/view/manage/brand/addBrand.dart';
import 'package:ashique_admin_app/view/manage/customer/model/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../order/OrderTile.dart';

class BrandScreen extends StatelessWidget {
  static const String routeName = 'BrandScreen';

  const BrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
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
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: ListTile(
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(10),
                    //     side: BorderSide(
                    //       color: Theme.of(context).primaryColor,
                    //       width: .2,
                    //     )),

                    tileColor: Colors.white,
                    style: ListTileStyle.drawer,
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage(appLogo),
                    ),
                    title: Row(
                      children: [
                        Text(
                          'Lenovo',
                          style: GoogleFonts.gabriela(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          padding:
                          const EdgeInsetsDirectional.symmetric(horizontal: 6,vertical: 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Theme.of(context).primaryColor.withOpacity(.2),
                          ),
                          child: Text(
                            '5 Items',
                            style: GoogleFonts.fraunces(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 8
                            ),
                          ),
                        )
                      ],
                    ),
                    subtitle: Text(
                      '#Id 12',
                      style: GoogleFonts.robotoMono(fontSize: 10),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                            onTap: () {
                              Get.to(const AddBrand(),
                                  transition: Transition.rightToLeftWithFade);
                            },
                            child: const Icon(
                              Icons.edit,
                              color: Colors.green,
                            )),
                        Container(
                          margin:
                              EdgeInsetsDirectional.symmetric(horizontal: 10),
                          height: 30,
                          width: 2,
                          color: Theme.of(context).primaryColor.withOpacity(.2),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).restorablePush(
                                  deleteConfirmDialog,
                                  arguments:
                                      'Are You Sure Want to delete this brand \n Lenovo');
                            },
                            child: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                      ],
                    ),
                  ),
                ),
                childCount: 15,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
