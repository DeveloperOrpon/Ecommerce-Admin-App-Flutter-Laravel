import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../extend/sliverAppBarDelegate.dart';
import 'ProductInfo.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,

      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            pinned: true,
            floating: true,
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: const Text('Catalogue'),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.search))
            ],
          ),
          SliverPersistentHeader(

            delegate: SliverAppBarDelegate(
               TabBar(
                controller: _tabController,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                labelStyle: TextStyle(fontSize: 15),
                unselectedLabelStyle: TextStyle(fontSize: 13),
                tabs: [
                  Tab( text: "Products",),
                  Tab(text: "Categories"),
                ],
              ),
            ),
            pinned: true,
            floating: false,

          ),
        ],
        body: TabBarView(
        controller: _tabController,
          children: const [
            ProductInfo(),
            ProductInfo(),
          ],
        ),
      ),

    );
  }
}