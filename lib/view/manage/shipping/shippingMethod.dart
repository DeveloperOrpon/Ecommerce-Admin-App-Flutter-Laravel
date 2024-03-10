import 'package:ashique_admin_app/config/appConst.dart';
import 'package:ashique_admin_app/view/manage/shipping/addShippingMthod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../config/refresh.dart';
import '../../../controller/shippingMethodController.dart';
import '../../widget/productSwitch.dart';

class ShippingMethod extends StatelessWidget {
  static const String routeName = 'ShippingMethod';

  const ShippingMethod({super.key});

  @override
  Widget build(BuildContext context) {
    final shippingMethodController = Get.put(ShippingMethodController());
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
          'Shipping Method',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: Obx(() {
        return SmartRefresher(
          physics: const BouncingScrollPhysics(),
          enablePullDown: true,
          enablePullUp: true,
          header: refreshLoading(context),
          footer: customFooter,
          controller: shippingMethodController.refreshController,
          onRefresh: shippingMethodController.onRefresh,
          onLoading: shippingMethodController.onLoading,
          child: CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
                  child: Text(
                    "Available Shipping Method",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      // fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                  padding: EdgeInsets.only(bottom: 10, left: 10, right: 10,top: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).primaryColor.withOpacity(.1)),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: shippingMethodController
                        .allShippingMethodModel.value.length,
                    itemBuilder: (context, index) => Container(
                      padding: EdgeInsets.all(12),
                      margin: EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: .4,
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "${shippingMethodController.allShippingMethodModel.value[index].title}"),
                              Text(
                                "Cost: ${shippingMethodController.allShippingMethodModel.value[index].cost} $currency",
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor),
                              ),
                              Text(
                                "Duration: ${shippingMethodController.allShippingMethodModel.value[index].duration} days",
                                style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ],
                          )),
                          CustomSwitch(
                            onTap: () {},
                            value: shippingMethodController
                                    .allShippingMethodModel
                                    .value[index]
                                    .status ==
                                1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 10),
                  child: CupertinoButton(
                    onPressed: () {
                      Get.to(const AddShippingMethod(),
                          transition: Transition.rightToLeftWithFade);
                    },
                    color: Theme.of(context).primaryColor,
                    child: const Text(
                      "Add More Method",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ]))
            ],
          ),
        );
      }),
    );
  }
}
