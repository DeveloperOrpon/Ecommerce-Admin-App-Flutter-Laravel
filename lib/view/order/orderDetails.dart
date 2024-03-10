import 'dart:developer';

import 'package:ashique_admin_app/config/appConst.dart';
import 'package:ashique_admin_app/controller/orderController.dart';
import 'package:ashique_admin_app/view/order/invoice/screen/InvoiceScreenPreview.dart';
import 'package:ashique_admin_app/view/order/productTile.dart';
import 'package:ashique_admin_app/view/widget/divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../helper/helper.dart';
import '../../helper/orderHelper.dart';
import '../../model/orderRes.dart';
import '../widget/statusChip.dart';

class OrderDetails extends StatefulWidget {
  final OrderModel orderModel;

  const OrderDetails({super.key, required this.orderModel});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  late OrderModel orderModel;

  @override
  void initState() {
    _initValueOrder();
    super.initState();
  }
  final orderController = Get.put(OrderController());
  _initValueOrder() {
    setState(() {
      orderModel = widget.orderModel;
    });

    orderController.orderDetails(widget.orderModel.id.toString()).then((value) {
      if (value == null) {
        showErrorToast('Warning', 'Order Information not found', context);
      } else {
        setState(() {
          orderModel = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: orderModel == null
          ? const CupertinoActivityIndicator()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
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
                            deleteDialog(context, onTap: () {});
                          },
                          child: Text(
                            "Delete",
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          )),
                      InkWell(
                        onTap: () {
                          showBottomSheetDialog(context, orderModel)
                              .then((value) {

                            _initValueOrder();
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 35,
                          width: 65,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10)),
                          ),
                          child: const Text(
                            'Update',
                            style: TextStyle(
                              color: CupertinoColors.white,
                              fontSize: 11,
                              // fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      )
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
                          InkWell(
                            onTap: () {
                              Get.to(
                                  InvoiceScreenPreview(
                                      orderResModel: orderModel),
                                  transition: Transition.leftToRightWithFade);
                            },
                            child: Text(
                              'Invoice',
                              style: TextStyle(
                                fontSize: 16,
                                color: theme.primaryColor,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    orderDetailsTile('Order Number', '#${orderModel.id}'),
                    orderDetailsTile('Order Date',
                        dateFormatOrder(orderModel.dateCreated.toString())),
                    orderDetailsTile('Order Last Update',
                        dateFormatOrder(orderModel.dateModified.toString())),
                    orderDetailsTile('Order Total', "BDT ${orderModel.total}",
                        isBold: true),
                    const SizedBox(height: 5),
                    const CustomDivider(height: 3),
                    const SizedBox(height: 5),
                    orderDetailsTile(
                        'Shipping Method', '${orderModel.shippingMethodTitle}'),
                    orderDetailsTile(
                        'Payment Method', '${orderModel.paymentMethodTitle}'),
                    const SizedBox(height: 5),
                    CustomDivider(height: 3),
                    const SizedBox(height: 5),
                    orderDetailsTile(
                        'Customer Name',
                        orderModel.customer == null
                            ? "Anonymous"
                            : (orderModel.customer!.fName.toString() +
                                orderModel.customer!.lName.toString())),
                    orderDetailsTile(
                        'Customer Email',
                        orderModel.customer == null
                            ? "Anonymous"
                            : (orderModel.customer!.email.toString())),
                    orderDetailsTile(
                        'Customer phone',
                        orderModel.customer == null
                            ? "Anonymous"
                            : (orderModel.customer!.phone.toString())),
                    orderDetailsTile(
                        'Address', '${orderModel.shipping!.fullAddress}'),
                    const SizedBox(height: 5),
                    const CustomDivider(height: 3),
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
                                  TextSpan(
                                    text: '${{
                                      orderModel.lineItems ?? []
                                    }.length}',
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: '    |    ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade200),
                                  ),
                                  const TextSpan(
                                    text: 'Total Quantity : ',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black54),
                                  ),
                                  TextSpan(
                                    text: countOrderProductQuantity(
                                        orderModel.lineItems ?? []),
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black),
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
                    delegate: SliverChildBuilderDelegate(
                        (context, index) => ProductTile(
                              theme: theme,
                              lineItems: (orderModel.lineItems ?? [])[index],
                            ),
                        childCount: (orderModel.lineItems ?? []).length),
                  ),
                  //order status
                  SliverList(
                      delegate: SliverChildListDelegate([
                    Container(
                      padding:
                          const EdgeInsets.only(bottom: 16, left: 5, right: 5),
                      decoration: BoxDecoration(
                        color: theme.primaryColor.withOpacity(.2),
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
                          Row(
                            children: [
                              Expanded(
                                  child: StatusChip(
                                      color: Colors.purple,
                                      title: '${orderModel.status?.capitalize}',
                                      iconData: Icons.shopping_bag_outlined)),
                              Expanded(
                                  child: StatusChip(
                                      color: Colors.amber,
                                      title:
                                          '${orderModel.deliveryStatus!.capitalize}',
                                      iconData: Icons.garage)),
                              Expanded(
                                  child: StatusChip(
                                      color: Colors.blue,
                                      title:
                                          '${orderModel.paymentStatus!.capitalize}',
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      decoration: BoxDecoration(
                        color: theme.primaryColor.withOpacity(.08),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 14.0, top: 4, bottom: 4),
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
                          _orderPaymentTile('Total Product Price',
                              'BDT ${orderModel.subtotal}', Colors.black),
                          _orderPaymentTile('Shipping Total',
                              'BDT ${orderModel.shippingTotal}', Colors.black),
                          _orderPaymentTile('Total Product Discount',
                              '- BDT ${orderModel.discountTotal}', Colors.red),
                          _orderPaymentTile('Total Amount Payable',
                              'BDT ${orderModel.total}', Colors.black),
                          _orderPaymentTile(
                              'Total Amount Paid', 'BDT 0', Colors.green),
                          _orderPaymentTile('Payment Due',
                              'BDT ${orderModel.total}', Colors.redAccent),
                        ],
                      ),
                    )
                  ])),

                  ///user address
                  SliverList(
                      delegate: SliverChildListDelegate([
                    const SizedBox(height: 14),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 10),
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
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  final Uri emailLaunchUri = Uri(
                                      scheme: 'mailto',
                                      path: '${orderModel.customer!.email}',
                                      queryParameters: {
                                        'subject':
                                            'Your Order ${orderModel.id}',
                                      });
                                  launchUrl(emailLaunchUri);
                                },
                                child: const Icon(
                                  CupertinoIcons.mail_solid,
                                  color: Colors.green,
                                ),
                              ),
                              SizedBox(width: 10),
                              InkWell(
                                onTap: () {
                                  final Uri phoneLaunchUri = Uri.parse(
                                      'tel:${orderModel.customer!.phone}');
                                  launchUrl(phoneLaunchUri);
                                },
                                child: const Icon(
                                  CupertinoIcons.phone_circle_fill,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          orderDetailsTile('Name',
                              '${orderModel.customer!.fName?.toString().capitalize}-${orderModel.customer!.lName.toString().capitalize}'),
                          orderDetailsTile(
                              'Mobile Number', '${orderModel.customer!.phone}'),
                          orderDetailsTile(
                              'Email', '${orderModel.customer!.email}'),
                          orderDetailsTile('Road',
                              '${orderModel.customer!.houseNo},${orderModel.customer!.apartmentNo},${orderModel.customer!.streetAddress}'),
                          orderDetailsTile(
                              'State', '${orderModel.customer!.streetAddress}'),
                          orderDetailsTile(
                              'City', '${orderModel.customer!.city}'),
                          orderDetailsTile(
                              'Country', '${orderModel.customer!.country}'),
                          orderDetailsTile(
                              'Platform', '${orderModel.customer!.platform}'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 200,
                    )
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

orderDetailsTile(String name, String value, {bool isBold = false}) {
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
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ),
      ],
    ),
  );
}
