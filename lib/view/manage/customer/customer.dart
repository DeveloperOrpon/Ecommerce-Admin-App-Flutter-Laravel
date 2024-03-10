import 'package:ashique_admin_app/controller/customerController.dart';
import 'package:ashique_admin_app/model/CustomerModel.dart';
import 'package:ashique_admin_app/view/manage/customer/customerDetails.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../config/api/api_route.dart';
import '../../../config/refresh.dart';
import 'model/dialog.dart';

class CustomerScreen extends StatelessWidget {
  static const String routeName = 'CustomerScreen';

  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final customerController = Get.put(CustomerController());
    // Future.delayed(
    //   Duration.zero,
    //   () {
    //     Navigator.of(context).restorablePush(infoDialog,
    //         arguments:
    //             'Tap the customer row in table for more details about customer');
    //   },
    // );
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
          'Customer ',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).restorablePush(infoDialog,
                  arguments:
                      'Tap the customer row in table for more details about customer');
            },
            icon: Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: Icon(
                Icons.info,
                color: Theme.of(context).primaryColor,
                size: 30,
              ),
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 5),
            child: SearchBar(
              controller: customerController.searchController,
              elevation: MaterialStatePropertyAll(0),
              leading: const Icon(CupertinoIcons.search),
              hintText: 'Search Customer',
              textStyle:
                  const MaterialStatePropertyAll(TextStyle(fontSize: 16)),
              hintStyle: const MaterialStatePropertyAll(
                  TextStyle(color: Colors.grey, fontSize: 14)),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
              backgroundColor: MaterialStatePropertyAll(Colors.grey.shade100),
              trailing: [
                IconButton(
                  onPressed: customerController.searchController.clear,
                  icon: Icon(Icons.clear),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Obx((){
          return SmartRefresher(
            physics: const BouncingScrollPhysics(),
            enablePullDown: true,
            enablePullUp: true,
            header: refreshLoading(context),
            footer: customFooter,
            controller: customerController.refreshController,
            onRefresh: customerController.onRefresh,
            onLoading: customerController.onLoading,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                  childCount: customerController.customerList.length,
                  (context, index) => _userTile(context, customerController.customerList.value[index]),
                ))
              ],
            ),
          );
        }
      ),
    );
  }

  Container _userTile(BuildContext context, CustomerModel customerModel) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
            width: 2,
          ), // You can customize this BorderSide as per your requirement
        ),
      ),
      child: ListTile(
        onTap: () {
          Get.to(CustomerDetails(id: customerModel.id.toString(),customerModel: customerModel,), transition: Transition.fadeIn);
        },
        contentPadding: EdgeInsets.zero,
        title: Text(
          "${customerModel.name}",
          style: GoogleFonts.roboto(
            fontSize: 14,
          ),
        ),
        subtitle: Text(
          '${customerModel.email}',
          style: GoogleFonts.roboto(
            fontSize: 12,
            color: Colors.black45,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Theme.of(context).primaryColor.withOpacity(.2),
          ),
          child: Text(
            '${(customerModel.orders??[]).length} Orders',
            style: GoogleFonts.roboto(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ),
        leading: CachedNetworkImage(
          imageUrl:customerModel.image.toString().contains('http')? customerModel.image.toString():"$PROFILE_IMAGE_URL${customerModel.image.toString()}",
          progressIndicatorBuilder: (context, url, progress) => CircleAvatar(
            radius: 30,
            child: SpinKitThreeBounce(
              color: Theme.of(context).primaryColor,
              size: 20,
            ),
          ),
          errorWidget: (context, url, error) => CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey.shade400,
            child: const Icon(FontAwesomeIcons.user),
          ),
          imageBuilder: (context, imageProvider){
            return CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey.shade400,
              backgroundImage: imageProvider,
              // child: const Icon(FontAwesomeIcons.user),
            );
          }
        ),
      ),
    );
  }
}
