import 'package:ashique_admin_app/helper/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../controller/productController.dart';
import '../../../extend/sliverAppBarDelegate.dart';
import '../category/category.dart';
import 'ProductInfo.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
  }
  final productController=Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
            ),
            pinned: true,
            floating: true,
            automaticallyImplyLeading: false,
            // centerTitle: true,
            title: const Text('Catalogue',style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),),
            actions: [
              IconButton(onPressed: () async {
                startLoading();
                productController.allCategoryList.value=[];
               productController.getAllCategories().then((value){
                 if(value){
                   Get.back();
                   showSuccessToastTop('Information', 'Products & Categories Update Latest Information', context);
                 }else{
                   Get.back();
                   showErrorToast("Warning", 'Something Error When try Reload', context);
                 }
               });
              }, icon: const Icon(CupertinoIcons.refresh))
            ],

            bottom: PreferredSize(
              preferredSize: Size.fromHeight(48),
              child: Material(
                elevation: 0,
                color: Colors.white,
                child: TabBar(
                  physics: const NeverScrollableScrollPhysics(),
                  indicatorColor: Theme.of(context).primaryColor,
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  labelStyle: TextStyle(fontSize: 15),
                  unselectedLabelStyle: TextStyle(fontSize: 13),
                  tabs: const [
                    Tab(
                      text: "Products",
                    ),
                    Tab(text: "Categories"),
                  ],
                ),
              ),
            ),
          ),
        ],
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: const [
            ProductInfo(),
            CategoryInfo(),
          ],
        ),
      ),
    );
  }
}
