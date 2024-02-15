import 'package:ashique_admin_app/view/widget/productItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SellerProducts extends StatelessWidget {
  const SellerProducts({super.key});

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
                  'Seller Products',
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
                      hintText: 'Search Product',
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
              child: const ProductItem(),
            ),childCount: 10))
          ],
        ),
      ),
    );
  }
}
