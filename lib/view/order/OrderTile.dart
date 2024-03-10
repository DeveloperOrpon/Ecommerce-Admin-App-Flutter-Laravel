import 'package:ashique_admin_app/model/orderRes.dart';
import 'package:ashique_admin_app/view/order/orderDetails.dart';
import 'package:ashique_admin_app/view/widget/networkImage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../config/api/api_route.dart';
import '../../config/appConst.dart';
import '../../controller/orderController.dart';
import '../../helper/orderHelper.dart';
import '../widget/statusChip.dart';

class OrderTile extends StatelessWidget {
  final OrderModel orderModel;

  const OrderTile(this.orderModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return orderModel.lineItems==null?const Center(): InkWell(
      onTap: () {
        Get.to( OrderDetails(orderModel: orderModel,), transition: Transition.upToDown);
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
                      NetworkImagePreview(
                        url: PRODUCT_IMAGE_URL +
                            orderModel.lineItems![0].featuredImage.toString(),
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
                          Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            orderModel.lineItems![0].name.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            '#${orderModel.id} • ${DateFormat('MMM d, yyyy').format(DateTime.parse(orderModel.dateCreated.toString()))} • ${orderModel.customer!.name}',
                            style:
                                TextStyle(fontSize: 12, color: Colors.blueGrey),
                          ),
                           Row(
                            children: [
                              Icon(
                                CupertinoIcons.location_solid,
                                size: 13,
                              ),
                              Expanded(
                                child: Text(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  '${orderModel.shipping!.fullAddress.toString()}',
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.blueGrey),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Row(
                              children: [
                                Text(
                                  '$currency ${orderModel.total}',
                                  style: TextStyle(
                                    fontSize: 16,
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
                                  child:  Text(
                                    '${orderModel.lineItems!.length} Qty',
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
                 Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: StatusChip(
                              color: Colors.purple,
                              title: '${orderModel.status?.capitalize}',
                              iconData: Icons.shopping_bag_outlined)),
                      Expanded(
                          child: StatusChip(
                              color: Colors.amber,
                              title: '${orderModel.deliveryStatus!.capitalize}',
                              iconData: Icons.garage)),
                      Expanded(
                          child: StatusChip(
                              color: Colors.blue,
                              title: '${orderModel.paymentStatus!.capitalize}',
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
                showBottomSheetDialog(context,orderModel);
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
}
