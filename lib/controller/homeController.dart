import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  RxInt homePageIndex = RxInt(0);
  RxInt orderPageIndex = RxInt(0);
  PageController pageController = PageController(initialPage: 0);
  late Gallery3DController controller;
  late TabController tabControllerOrder ;

  List demoImages = [
    "https://static-01.daraz.com.bd/p/1dce0c49e41a86363139c29601384972.jpg_750x750.jpg_.webp",
    "https://static-01.daraz.com.bd/p/f40da8f249b2ffbabede9774e581db1e.jpg_750x750.jpg_.webp",
    'https://static-01.daraz.com.bd/p/f845f9e8d1778f352be7f070819670a0.jpg_750x750.jpg_.webp',
    "https://static-01.daraz.com.bd/p/1dce0c49e41a86363139c29601384972.jpg_750x750.jpg_.webp",
    "https://static-01.daraz.com.bd/p/f40da8f249b2ffbabede9774e581db1e.jpg_750x750.jpg_.webp",
    'https://static-01.daraz.com.bd/p/f845f9e8d1778f352be7f070819670a0.jpg_750x750.jpg_.webp',
    "https://static-01.daraz.com.bd/p/1dce0c49e41a86363139c29601384972.jpg_750x750.jpg_.webp",
    "https://static-01.daraz.com.bd/p/f40da8f249b2ffbabede9774e581db1e.jpg_750x750.jpg_.webp",
    'https://static-01.daraz.com.bd/p/f845f9e8d1778f352be7f070819670a0.jpg_750x750.jpg_.webp'
  ];
  List<String> homeGrid = [
    'Orders',
    'Returned',
    'Failed',
    'Total Sales',
    'Products',
    'Categories',
    'Brands',
    'Subcategories',
  ];
  List<String> homeGridFilter = [
    'Lifetime',
    'Today',
    'Yesterday',
    'This Week',
    'Last Week',
    'This Month',
    'Last Month',
    'Custom range',
  ];
 List<String> orderGrid = [
    'All',
    'Pending',
    'Confirmed',
    'Processing',
    'Shipped',
    'Delivered',
    'Rejected',
    'Cancelled',
    'Failed',
  ];

  @override
  void onInit() {
    tabControllerOrder = TabController(length: 4, vsync: this);
    controller = Gallery3DController(
        itemCount: 9, autoLoop: true, ellipseHeight: 0, minScale: 0.4);
    super.onInit();
  }
}
