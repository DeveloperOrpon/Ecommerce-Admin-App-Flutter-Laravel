import 'package:ashique_admin_app/view/manage/banner/chooseBanner.dart';
import 'package:ashique_admin_app/view/manage/shipping/shippingMethod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../view/manage/payment/paymentMethod.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  RxInt homePageIndex = RxInt(0);
  RxInt orderPageIndex = RxInt(0);
  PageController pageController = PageController(initialPage: 0);
  late Gallery3DController controller;
  late TabController tabControllerOrder;

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
  List<Map<String, dynamic>> manageGrid = [
    {
      "Banner": Icons.image,
      'info':
          'Create and showcase banners to promote featured products or announcements.',
      'route': ChooseBanner.routeName
    },
    {
      "Shipping Method": Icons.local_shipping,
      'info': 'Manage and track your product shipments with ease.',
      'route': ShippingMethod.routeName
    },
    {
      "Payment Method": FontAwesomeIcons.ccVisa,
      'info':
          'Securely process payments using various payment methods, including Visa.',
      'route': PaymentMethod.routeName
    },
    {
      "Coupon": Icons.discount,
      'info': 'Create and manage discount coupons to attract more customers.',
    },
    {
      "Push Notification": CupertinoIcons.bell,
      'info':
          'Keep your customers informed with push notifications about promotions and updates.',
    },
    {
      "Customer": CupertinoIcons.person_2_alt,
      'info': 'View and manage customer information and orders efficiently.',
    },
    {
      "Support ticket": Icons.support_agent,
      'info':
          'Handle customer support tickets and provide assistance as needed.',
    },
    {
      "Business Settings": Icons.settings,
      'info':
          'Configure and customize your business settings for optimal performance.',
    },
    {
      "Product Reviews": Icons.reviews,
      'info':
          'Monitor and respond to product reviews to enhance customer satisfaction.',
    },
    {
      "All Deals": CupertinoIcons.settings,
      'info':
          'Explore and manage all ongoing deals and promotions in one place.',
    },
    {
      "Sellers": Icons.pets_outlined,
      'info':
          'Manage sellers and their products to ensure a diverse and quality product catalog.',
    },
    {
      "Brand": Icons.branding_watermark,
      'info':
          'Establish and manage brand identity for a consistent and recognizable presence.',
    },
    {
      "Currency": Icons.monetization_on,
      'info': '',
    },
    {
      "Social Media": FontAwesomeIcons.facebook,
      'info': '',
    },
    {
      "Web Config": Icons.wordpress_sharp,
      'info': '',
    },
    {
      "Product Reviews": Icons.star,
      'info': '',
    },
    {
      "Mail Config": Icons.mail,
      'info': '',
    },
  ];

  @override
  void onInit() {
    tabControllerOrder = TabController(length: 4, vsync: this);
    controller = Gallery3DController(
        itemCount: 9, autoLoop: true, ellipseHeight: 0, minScale: 0.4);
    super.onInit();
  }
}
