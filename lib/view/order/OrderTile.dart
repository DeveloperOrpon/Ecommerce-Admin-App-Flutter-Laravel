import 'package:ashique_admin_app/view/order/orderDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/appConst.dart';
import '../../controller/orderController.dart';
import '../widget/statusChip.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(const OrderDetails(),transition: Transition.upToDown);
      },
      child: Stack(
        children: [
          Container(
            height: 130,
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Theme.of(context).primaryColor.withOpacity(.5),
                  width: .4,
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 90,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        appLogo,
                        width: 85,
                        height: 100,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        color: Theme.of(context).primaryColor.withOpacity(.4),
                        width: 1,
                        height: 50,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            'Order Title will be there with order name Order Title will be there with order name',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const Text(
                            '#1092 . Feb 2,2024 . Orpon Hasan',
                            style:
                                TextStyle(fontSize: 12, color: Colors.blueGrey),
                          ),
                          const Row(
                            children: [
                              Icon(
                                CupertinoIcons.location_solid,
                                size: 13,
                              ),
                              Text(
                                'Shewrapara Mirpur -10  Dhaka Bangladesh',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.blueGrey),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Row(
                              children: [
                                Text(
                                  'BDT 256.00',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(4),
                                  margin: EdgeInsets.only(left: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                      color: Theme.of(context).primaryColor,
                                      width: .5,
                                    ),
                                  ),
                                  child: const Text(
                                    '1 Qty',
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ))
                    ],
                  ),
                ),
                const Expanded(
                  child: Row(
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
                )
              ],
            ),
          ),
          Positioned(
            right: 0,
            child: InkWell(
              onTap: () {
                _showBottomSheetDialog(context);
              },
              child: Container(
                alignment: Alignment.center,
                height: 30,
                width: 50,
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
            ),
          )
        ],
      ),
    );
  }

  _showBottomSheetDialog(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: CupertinoColors.white,
      context: context,
      builder: (context) => Container(
        decoration: const BoxDecoration(
            color: CupertinoColors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
            )),
        height: Get.height * .4,
        padding: EdgeInsets.all(14),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Choose Status Update",
                style: GoogleFonts.alef(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            Divider(),
            SizedBox(height: 10),
            _tile('Order Status', () {
              _showOrderStatusDialog(context);
            }),
            _tile('Shipping Status', () {
              _showShippingStatusDialog(context);
            }),
            _tile('Payment Status', () {
              _showPaymentStatusDialog(context);
            }),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: CupertinoButton(
                  onPressed: () {
                    Get.back();
                  },
                  color: Theme.of(context).primaryColor,
                  child: const Text(
                    'UPDATE STATUS',
                    style: TextStyle(color: CupertinoColors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }

  _tile(String title, Function onTileTap,
      {bool showRadioButton = false,
      bool radioButtonValue = false,
      Function? radioButton}) {
    return InkWell(
      onTap: () {
        onTileTap();
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(child: Text(title)),
            showRadioButton
                ? Radio(
                    value: title,
                    groupValue: radioButtonValue,
                    onChanged: radioButton!())
                : const Icon(Icons.arrow_forward_ios_rounded)
          ],
        ),
      ),
    );
  }

  _showOrderStatusDialog(BuildContext context) {
    final orderController = Get.put(OrderController());
    showModalBottomSheet(
      backgroundColor: CupertinoColors.white,
      context: context,
      builder: (context) => Container(
        decoration: const BoxDecoration(
            color: CupertinoColors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
            )),
        height: Get.height * .7,
        padding: EdgeInsets.all(14),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Order Status",
                style: GoogleFonts.alef(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            Divider(),
            SizedBox(height: 10),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) => _tile(
                  '${orderController.orderStatus[index]}', () {},
                  radioButton: () {},
                  radioButtonValue: false,
                  showRadioButton: true),
              itemCount: orderController.orderStatus.length,
            )),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: CupertinoButton(
                  onPressed: () {
                    Get.back();
                  },
                  color: Theme.of(context).primaryColor,
                  child: const Text(
                    'UPDATE STATUS',
                    style: TextStyle(color: CupertinoColors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
  _showShippingStatusDialog(BuildContext context) {
    final orderController = Get.put(OrderController());
    showModalBottomSheet(
      backgroundColor: CupertinoColors.white,
      context: context,
      builder: (context) => Container(
        decoration: const BoxDecoration(
            color: CupertinoColors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
            )),
        height: Get.height * .7,
        padding: EdgeInsets.all(14),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Shipping Status",
                style: GoogleFonts.alef(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            Divider(),
            SizedBox(height: 10),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) => _tile(
                  '${orderController.shippingStatus[index]}', () {},
                  radioButton: () {},
                  radioButtonValue: false,
                  showRadioButton: true),
              itemCount: orderController.shippingStatus.length,
            )),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: CupertinoButton(
                  onPressed: () {
                    Get.back();
                  },
                  color: Theme.of(context).primaryColor,
                  child: const Text(
                    'UPDATE STATUS',
                    style: TextStyle(color: CupertinoColors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
  _showPaymentStatusDialog(BuildContext context) {
    final orderController = Get.put(OrderController());
    showModalBottomSheet(
      backgroundColor: CupertinoColors.white,
      context: context,
      builder: (context) => Container(
        decoration: const BoxDecoration(
            color: CupertinoColors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
            )),
        height: Get.height * .7,
        padding: EdgeInsets.all(14),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Payment Status",
                style: GoogleFonts.alef(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            Divider(),
            SizedBox(height: 10),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) => _tile(
                  '${orderController.paymentStatus[index]}', () {},
                  radioButton: () {},
                  radioButtonValue: false,
                  showRadioButton: true),
              itemCount: orderController.paymentStatus.length,
            )),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: CupertinoButton(
                  onPressed: () {
                    Get.back();
                  },
                  color: Theme.of(context).primaryColor,
                  child: const Text(
                    'UPDATE STATUS',
                    style: TextStyle(color: CupertinoColors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
