
import 'package:ashique_admin_app/view/manage/productReviews/review_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductReviews extends StatelessWidget {
  static const String routeName = 'ProductReviews';

  const ProductReviews({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
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
                'Product Reviews',
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
                      elevation: MaterialStatePropertyAll(0),
                      leading: const Icon(CupertinoIcons.search),
                      hintText: 'Search Customer',
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
            SliverList(delegate: SliverChildListDelegate([
              SizedBox(height: 10),
              ReviewTile(),
              ReviewTile(),
              ReviewTile(),
              ReviewTile(),
              ReviewTile(),
              ReviewTile(),
              ReviewTile(),
              ReviewTile(),
              ReviewTile(),
            ]))
          ],
        ),
      ),
    );
  }
}
