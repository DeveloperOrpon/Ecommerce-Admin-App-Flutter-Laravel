import 'package:ashique_admin_app/model/orderRes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../order/OrderTile.dart';

class SellerOrders extends StatelessWidget {
  const SellerOrders({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                foregroundColor: Colors.white,
                surfaceTintColor: Colors.white,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarBrightness: Brightness.dark,
                  statusBarIconBrightness: Brightness.dark,
                ),
                pinned: true,
                floating: true,
                automaticallyImplyLeading: false,
                centerTitle: true,
                title: const Text(
                  'Seller Orders',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                actions: [
                  // IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.search))
                ],
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(56),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SearchBar(
                      controller: searchController,
                      elevation: const MaterialStatePropertyAll(0),
                      leading: const Icon(CupertinoIcons.search),
                      hintText: 'Search Orders',
                      textStyle:
                      const MaterialStatePropertyAll(TextStyle(fontSize: 16)),
                      hintStyle: const MaterialStatePropertyAll(
                          TextStyle(color: Colors.grey, fontSize: 14)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                      backgroundColor: MaterialStatePropertyAll(Colors.grey.shade100),
                      trailing: [
                        IconButton(
                          onPressed: searchController.clear,
                          icon: Icon(Icons.clear),
                        ),
                      ],
                    ),
                  ),
                )
            ),
            SliverList(delegate: SliverChildBuilderDelegate((context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: OrderTile(OrderModel()),
            ),childCount: 10))
          ],
        ),
      ),
    );
  }
}
