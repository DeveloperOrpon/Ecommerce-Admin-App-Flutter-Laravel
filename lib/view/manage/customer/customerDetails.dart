import 'package:ashique_admin_app/config/appConst.dart';
import 'package:ashique_admin_app/view/manage/customer/customerOrder.dart';
import 'package:ashique_admin_app/view/order/OrderTile.dart';
import 'package:ashique_admin_app/view/widget/productSwitch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../order/orderDetails.dart';

class CustomerDetails extends StatelessWidget {
  final int id;
  const CustomerDetails({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
        title:  Text(
          'Customer ID #$id',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: CustomSwitch(),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      color: theme.primaryColor.withOpacity(.08),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundImage: AssetImage(appLogo),
                            ),
                            Spacer(),
                            Icon(
                              CupertinoIcons.mail_solid,
                              color: Colors.green,
                              size: 40,
                            ),
                            SizedBox(width: 10),
                            Icon(
                              CupertinoIcons.phone_circle_fill,
                              color: Colors.blue,
                              size: 40,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 7.0, top: 4, bottom: 4),
                              child: Text(
                                maxLines: 2,
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.ellipsis,
                                "Customer Details ",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: theme.primaryColor,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Spacer(),

                          ],
                        ),
                        SizedBox(height: 5),
                        orderDetailsTile('Name', 'Orpon Hasan'),
                        orderDetailsTile('Mobile Number', '01932610623'),
                        orderDetailsTile('Email', 'developerorpon@gmail.com'),
                        orderDetailsTile('Road', 'A5,B Block'),
                        orderDetailsTile('State', 'Dhaka'),
                        orderDetailsTile('City', 'Dhaka'),
                        orderDetailsTile('Country', 'Bangladesh'),
                        orderDetailsTile(
                            'Address', 'Mirpur,Shewrapara,Dhaka,Bangladesh'),
                        orderDetailsTile(
                            'Joined At', '15 Jan 2024 19:20:47'),
                        orderDetailsTile(
                            'Total Orders', '15'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,)
                ])),
            ////order summery
            SliverList(delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                child: Row(
                  children: [
                    const CircleAvatar(radius: 8),
                    const SizedBox(width: 5),
                    Text(
                      "Order Summery",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        // fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    TextButton(onPressed: () {
                      Get.to(const CustomerOrder(),transition: Transition.rightToLeftWithFade);
                    }, child: const Text('See All'))
                  ],
                ),
              ),
            ])),
            SliverList(delegate: SliverChildBuilderDelegate((context, index) => OrderTile(),childCount: 2))
          ],
        ),
      ),
    );
  }
}
