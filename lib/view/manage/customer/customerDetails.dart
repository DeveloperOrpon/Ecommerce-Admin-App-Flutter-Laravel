import 'package:ashique_admin_app/config/appConst.dart';
import 'package:ashique_admin_app/controller/orderController.dart';
import 'package:ashique_admin_app/helper/helper.dart';
import 'package:ashique_admin_app/model/CustomerModel.dart';
import 'package:ashique_admin_app/view/manage/customer/customerOrder.dart';
import 'package:ashique_admin_app/view/order/OrderTile.dart';
import 'package:ashique_admin_app/view/widget/productSwitch.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../config/api/api_route.dart';
import '../../../model/orderRes.dart' as or;
import '../../order/orderDetails.dart';

class CustomerDetails extends StatelessWidget {
  final String id;
  final CustomerModel customerModel;

  const CustomerDetails(
      {super.key, required this.id, required this.customerModel});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final orderController=Get.put(OrderController());
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
        title: Text(
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
                        Row(
                          children: [
                            CachedNetworkImage(
                                imageUrl: customerModel.image.toString()
                                    .contains('http')
                                    ? customerModel.image.toString()
                                    : "$PROFILE_IMAGE_URL${customerModel.image
                                    .toString()}",
                                progressIndicatorBuilder: (context, url,
                                    progress) =>
                                    CircleAvatar(
                                      radius: 35,
                                      child: SpinKitThreeBounce(
                                        color: Theme
                                            .of(context)
                                            .primaryColor,
                                        size: 20,
                                      ),
                                    ),
                                errorWidget: (context, url, error) =>
                                    CircleAvatar(
                                      radius: 35,
                                      backgroundColor: Colors.grey.shade400,
                                      child: const Icon(FontAwesomeIcons.user),
                                    ),
                                imageBuilder: (context, imageProvider) {
                                  return CircleAvatar(
                                    radius: 35,
                                    backgroundColor: Colors.grey.shade400,
                                    backgroundImage: imageProvider,
                                    // child: const Icon(FontAwesomeIcons.user),
                                  );
                                }
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                final Uri emailLaunchUri = Uri(
                                    scheme: 'mailto',
                                    path: customerModel.email.toString(),
                                    queryParameters: {
                                      'subject':
                                      'Your Order ${customerModel.name}',
                                    });
                                launchUrl(emailLaunchUri);
                              },
                              child: const Icon(
                                CupertinoIcons.mail_solid,
                                color: Colors.green,
                                size: 40,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                final Uri phoneLaunchUri = Uri.parse(
                                    'tel:${customerModel.phone}');
                                launchUrl(phoneLaunchUri);
                              },
                              child: const Icon(
                                CupertinoIcons.phone_circle_fill,
                                color: Colors.blue,
                                size: 40,
                              ),
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
                        orderDetailsTile('Name', '${customerModel.name}'),
                        orderDetailsTile(
                            'Mobile Number', '${customerModel.phone}'),
                        orderDetailsTile('Email', '${customerModel.email}'),
                        orderDetailsTile(
                            'Road', '${customerModel.streetAddress}'),
                        orderDetailsTile('City', '${customerModel.city}'),
                        orderDetailsTile('Country', '${customerModel.country}'),
                        orderDetailsTile(
                            'Zip', '${customerModel.zip}'),
                        orderDetailsTile(
                            'Joined At', customerModel.createdAt!=null?dateFormatOrder(customerModel.createdAt.toString()):'No Value'),
                        orderDetailsTile(
                            'Total Orders',
                            "${(customerModel.orders ?? []).length}"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,)
                ])),
            ////order summery
            SliverList(delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                child: Row(
                  children: [
                    const CircleAvatar(radius: 8),
                    const SizedBox(width: 5),
                    Text(
                      "Order Summery",
                      style: TextStyle(
                        color: Theme
                            .of(context)
                            .primaryColor,
                        // fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const Spacer(),
                    TextButton(onPressed: (customerModel.orders ?? []).isEmpty?null: () {
                      Get.to(CustomerOrder(orders: (customerModel.orders ?? []),),
                          transition: Transition.rightToLeftWithFade);
                    }, child: const Text('See All'))
                  ],
                ),
              ),
            ])),
            SliverList(delegate: SliverChildBuilderDelegate((context, index) {
              final order = (customerModel.orders ?? [])[index];
              return OrderTile(order);
            }, childCount: (customerModel.orders ?? []).length))
          ],
        ),
      ),
    );
  }
}
