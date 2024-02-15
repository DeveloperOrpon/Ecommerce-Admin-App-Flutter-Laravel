import 'package:ashique_admin_app/view/manage/banner/chooseBanner.dart';
import 'package:ashique_admin_app/view/manage/shipping/shippingMethod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../view/manage/MailConfig/MailConfig.dart';
import '../view/manage/Sellers/Sellers.dart';
import '../view/manage/SocialMedia/SocialMedia.dart';
import '../view/manage/WebConfig/WebConfig.dart';
import '../view/manage/brand/brandScreen.dart';
import '../view/manage/businessSettings/businessSettings.dart';
import '../view/manage/businessSettings/currency/home.dart';
import '../view/manage/coupon/coupon.dart';
import '../view/manage/customer/customer.dart';
import '../view/manage/deals/allDeals.dart';
import '../view/manage/payment/paymentMethod.dart';
import '../view/manage/productReviews/ProductReviews.dart';
import '../view/manage/pushNotification/pushNotificationSetting.dart';
import '../view/manage/supportTicket/supportTicket.dart';

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
      'route': CouponScreen.routeName
    },
    {
      "Push Notification": CupertinoIcons.bell,
      'info':
          'Keep your customers informed with push notifications about promotions and updates.',
      'route': PushNotificationSetting.routeName
    },
    {
      "Customer": CupertinoIcons.person_2_alt,
      'info': 'View and manage customer information and orders efficiently.',
      'route': CustomerScreen.routeName
    },
    {
      "Brand": Icons.branding_watermark,
      'info':
          'Establish and manage brand identity for a consistent and recognizable presence.',
      'route': BrandScreen.routeName
    },
    {
      "All Deals": CupertinoIcons.settings,
      'info':
          'Explore and manage all ongoing deals and promotions in one place.',
      'route': AllDeals.routeName
    },
    {
      "Support ticket": Icons.support_agent,
      'info':
          'Handle customer support tickets and provide assistance as needed.',
      'route': SupportTicket.routeName
    },
    {
      "Business Settings": Icons.settings,
      'info':
          'Configure and customize your business settings for optimal performance.',
      'route': BusinessSettings.routeName
    },
    {
      "Product Reviews": Icons.reviews,
      'info':
          'Monitor and respond to product reviews to enhance customer satisfaction.',
      'route': ProductReviews.routeName
    },
    {
      "Sellers": Icons.pets_outlined,
      'info':
          'Manage sellers and their products to ensure a diverse and quality product catalog.',
      'route': SellersScreen.routeName
    },
    {
      "Currency": Icons.monetization_on,
      'info': 'Manage currency settings for your business.',
      'route': CurrencyHome.routeName
    },
    {
      "Social Media": FontAwesomeIcons.facebook,
      'info': 'Manage social media settings and integrations.',
      'route': SocialMedia.routeName
    },
    {
      "Web Config": Icons.wordpress_sharp,
      'info': 'Configure web-related settings for your business.',
      'route': WebConfig.routeName
    },
    {
      "Mail Config": Icons.mail,
      'info': 'Configure email-related settings for your business.',
      'route': MailConfig.routeName
    },
  ];
  List<Map<String, dynamic>> socialGrid = [
    {
      "logo": 'assets/logo/facebook.png',
      'title': 'Facebook',
    },
    {
      "logo": 'assets/logo/instagram.png',
      'title': 'Instagram',
    },
    {
      "logo": 'assets/logo/linkedin.png',
      'title': 'Linkedin',
    },
    {
      "logo": 'assets/logo/pinterest.png',
      'title': 'Pinterest',
    },
    {
      "logo": 'assets/logo/twitter.png',
      'title': 'Twitter',
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
