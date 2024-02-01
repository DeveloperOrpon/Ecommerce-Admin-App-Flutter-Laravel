import 'package:ashique_admin_app/controller/homeController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderContent extends StatelessWidget {
  const OrderContent({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return DefaultTabController(
      length: homeController.orderGrid.length,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Order Information'),
            centerTitle: true,
            bottom: TabBar(
              controller: homeController.tabControllerOrder,
              isScrollable: true,
              onTap: (value) {
                homeController.orderPageIndex.value = value;
              },
              tabs: homeController.orderGrid
                  .map(
                    (e) => Tab(
                      iconMargin: EdgeInsets.zero,
                      child: Obx(() {
                        return Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: homeController.orderGrid[homeController
                                          .orderPageIndex.value] ==
                                      e
                                  ? Colors.white
                                  : Colors.transparent,
                              border: Border.all(
                                color: Colors.white,
                                width: 1,
                              )),
                          child: Text(
                            e,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: homeController.orderGrid[homeController
                                          .orderPageIndex.value] ==
                                      e
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                        );
                      }),
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
