import 'package:ashique_admin_app/config/appConst.dart';
import 'package:ashique_admin_app/controller/homeController.dart';
import 'package:ashique_admin_app/view/order/OrderTile.dart';
import 'package:ashique_admin_app/view/order/PlacedOrder/placeOrder.dart';
import 'package:ashique_admin_app/view/order/showDateDialog.dart';
import 'package:ashique_admin_app/view/widget/statusChip.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/textStyle.dart';
import '../../controller/orderController.dart';

class OrderContent extends StatelessWidget {
  const OrderContent({super.key});

  @override
  Widget build(BuildContext context) {
    final orderController = Get.put(OrderController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            leading: Center(),

            elevation: 0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
            ),
            title: const Text(
              'Order Information',
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Get.to(PlaceOrder(),transition: Transition.upToDown);
                  },
                  icon: const Icon(
                    CupertinoIcons.add,
                    color: Colors.black,
                  ))
            ],
            expandedHeight: 160,
            flexibleSpace: Container(
              margin: EdgeInsets.only(top: 80),
              child: FormBuilderTextField(
                name: 'search',
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  hintText: 'Search',
                  prefixIcon: Icon(CupertinoIcons.search),
                  labelStyle: TextStyle(
                      fontSize: 12, color: Theme.of(context).primaryColor),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                autofillHints: const [AutofillHints.email],
                style: const TextStyle(fontSize: 14),
              ),
            ),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(100),
                child: Obx(() {
                  return ChipsChoice<String>.single(
                    scrollPhysics: BouncingScrollPhysics(),
                    choiceStyle: C2ChipStyle.filled(
                      selectedStyle: const C2ChipStyle(),
                    ),
                    value: orderController.orderStatusFilter.value,
                    onChanged: (value) {
                      orderController.orderStatusFilter.value = value;
                    },
                    choiceItems: C2Choice.listFrom<String, String>(
                      source: orderController.orderGrid,
                      value: (i, v) => v,
                      label: (i, v) => v,
                    ),
                  );
                })),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Row(
              children: [
                Expanded(child: showDateDialog(context)),
                const SizedBox(width: 13),
                Expanded(
                    child: FormBuilderTextField(
                  name: 'search',
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: 'Search by order ID',
                    prefixIcon: Icon(CupertinoIcons.search),
                    labelStyle: TextStyle(
                        fontSize: 12, color: Theme.of(context).primaryColor),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                  autofillHints: const [AutofillHints.email],
                  style: const TextStyle(fontSize: 14),
                )),
              ],
            ),
            Obx(() {
              return ChipsChoice<String>.single(
                verticalDirection: VerticalDirection.up,
                scrollPhysics: BouncingScrollPhysics(),
                choiceCheckmark: true,
                choiceStyle: C2ChipStyle.filled(
                  selectedStyle: const C2ChipStyle(),
                ),
                value: orderController.orderFilterValue.value,
                onChanged: (value) {
                  orderController.orderFilterValue.value = value;
                },
                choiceItems: C2Choice.listFrom<String, String>(
                  source: orderController.orderFilter,
                  value: (i, v) => v,
                  label: (i, v) => v,
                ),
              );
            }),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                "Orders List",
                style: GoogleFonts.alef(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
            ),
          ])),
          SliverList(delegate: SliverChildBuilderDelegate((context, index) => const OrderTile(),childCount: 10))
        ],
      ),
    );
  }
}
