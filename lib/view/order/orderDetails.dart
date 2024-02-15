import 'package:ashique_admin_app/config/appConst.dart';
import 'package:ashique_admin_app/view/order/productTile.dart';
import 'package:ashique_admin_app/view/widget/divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../helper/helper.dart';
import '../widget/statusChip.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              pinned: true,
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  )),
              elevation: 0,
              backgroundColor: Colors.white,
              foregroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarBrightness: Brightness.dark,
                statusBarIconBrightness: Brightness.dark,
              ),
              title: const Text(
                'Order Details',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      deleteDialog(context,onTap: (){});
                    },
                    child: Text(
                      "Delete",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ))
              ],
            ),
            //orderDetails
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                decoration: BoxDecoration(
                  color: theme.primaryColor.withOpacity(.08),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Order Details',
                      style: TextStyle(
                        fontSize: 16,
                        color: theme.primaryColor,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Invoice',
                      style: TextStyle(
                        fontSize: 16,
                        color: theme.primaryColor,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              orderDetailsTile('Order Number', '100023'),
              orderDetailsTile('Order Date', '02 Feb,2024'),
              orderDetailsTile('Order Total', "BDT 10,000"),
              const SizedBox(height: 5),
              CustomDivider(height: 3),
              const SizedBox(height: 5),
              orderDetailsTile('Shipping Method', 'Express Delivery'),
              orderDetailsTile('Payment Method', 'Cash On Delivery'),
              const SizedBox(height: 5),
              CustomDivider(height: 3),
              const SizedBox(height: 5),
              orderDetailsTile('Customer Name', 'Orpon Hasan'),
              orderDetailsTile('Address',
                  'Shewrapara Shamimshoroni,Mirpur,Dhaka,Bangladesh'),
              const SizedBox(height: 5),
              CustomDivider(height: 3),
              const SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 5),
                decoration: BoxDecoration(
                  color: theme.primaryColor.withOpacity(.08),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order List',
                      style: TextStyle(
                        fontSize: 16,
                        color: theme.primaryColor,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            const TextSpan(
                              text: 'Total Products : ',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black54),
                            ),
                            const TextSpan(
                              text: '5',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                            ),
                            TextSpan(
                              text: '    |    ',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey.shade200),
                            ),
                            const TextSpan(
                              text: 'Total Quantity : ',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black54),
                            ),
                            const TextSpan(
                              text: '10',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                            ),
                          ]))
                        ],
                      ),
                    )
                  ],
                ),
              )
            ])),

            ///product Info
            SliverList(
              delegate: SliverChildListDelegate([
                ProductTile(theme: theme),
                ProductTile(theme: theme),
                ProductTile(theme: theme),
              ]),
            ),
            //order status
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                padding: EdgeInsets.only(bottom: 16, left: 5, right: 5),
                decoration: BoxDecoration(
                  color: theme.primaryColor.withOpacity(.08),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        maxLines: 2,
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.ellipsis,
                        "Order Status ",
                        style: TextStyle(
                          fontSize: 14,
                          color: theme.primaryColor,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Row(
                      children: [
                        Expanded(
                            child: StatusChip(
                                color: Colors.purple,
                                title: 'Pending',
                                iconData: Icons.shopping_bag_outlined)),
                        Expanded(
                            child: StatusChip(
                                color: Colors.amber,
                                title: 'Waiting',
                                iconData: Icons.garage)),
                        Expanded(
                            child: StatusChip(
                                color: Colors.blue,
                                title: 'Un-Paid',
                                iconData: Icons.payment)),
                      ],
                    ),
                  ],
                ),
              )
            ])),

            ///payment details
            SliverList(
                delegate: SliverChildListDelegate([
              const SizedBox(height: 14),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                decoration: BoxDecoration(
                  color: theme.primaryColor.withOpacity(.08),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 14.0, top: 4, bottom: 4),
                      child: Text(
                        maxLines: 2,
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.ellipsis,
                        "Payment Details ",
                        style: TextStyle(
                          fontSize: 14,
                          color: theme.primaryColor,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    _orderPaymentTile(
                        'Total Product Price', 'BDT 5000', Colors.black),
                    _orderPaymentTile(
                        'Total Product Discount', '- BDT 50', Colors.red),
                    _orderPaymentTile(
                        'Total Amount Payable', 'BDT 4950', Colors.black),
                    _orderPaymentTile(
                        'Total Amount Paid', 'BDT 500', Colors.green),
                    _orderPaymentTile(
                        'Payment Due', 'BDT 4450', Colors.redAccent),
                  ],
                ),
              )
            ])),

            ///user address
            SliverList(
                delegate: SliverChildListDelegate([
              const SizedBox(height: 14),
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
                        Icon(
                          CupertinoIcons.mail_solid,
                          color: Colors.green,
                        ),
                        SizedBox(width: 10),
                        Icon(
                          CupertinoIcons.phone_circle_fill,
                          color: Colors.blue,
                        ),
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
                  ],
                ),
              ),
                  SizedBox(height: 200,)
            ])),
          ],
        ),
      ),
    );
  }

  _orderPaymentTile(String name, String value, Color valueColor) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
              Text(
                maxLines: 2,
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                "${value}",
                style: TextStyle(
                  fontSize: 14,
                  color: valueColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.black12,
          )
        ],
      ),
    );
  }


}
orderDetailsTile(String name, String value) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 3),
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            name,
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ),
        Expanded(
          flex: 4,
          child: Text(
            maxLines: 2,
            textAlign: TextAlign.justify,
            overflow: TextOverflow.ellipsis,
            ":  ${value}",
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    ),
  );
}