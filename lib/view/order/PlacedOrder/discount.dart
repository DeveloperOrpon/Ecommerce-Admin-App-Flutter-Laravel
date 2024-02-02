import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../config/appConst.dart';

class Discount extends StatelessWidget {
  const Discount({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
            ),
            bottom: const TabBar(
              labelStyle: TextStyle(
                fontSize: 16,
              ),
              unselectedLabelStyle: TextStyle(fontSize: 16),
              tabs: [
                Tab(
                  text: 'By amount ($currency)',
                ),
                Tab(
                  text: 'By percentage (%)',
                ),
              ],
            ),
            title: const Text(
              'Order Discount',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
            ),
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  CupertinoIcons.xmark,
                  color: Colors.black,
                )),
            actions: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Confirm',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CupertinoTextField(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: Colors.grey.shade500,
                              width: .3,
                            )),
                        placeholder: 'Amount',
                        placeholderStyle: TextStyle(
                          color: Colors.black45,
                          fontSize: 14,
                        ),
                        prefix: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("-$currency"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CupertinoTextField(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: Colors.grey.shade500,
                              width: .3,
                            )),
                        placeholder: 'Percentage',
                        placeholderStyle: TextStyle(
                          color: Colors.black45,
                          fontSize: 14,
                        ),
                        prefix: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("-%"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
