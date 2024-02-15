import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as DIO;
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../config/api/Interceptors/ConnectivityRequestRetrier.dart';
import '../config/api/Interceptors/RetryOnConnectionChangeIntercptor.dart';
import '../config/api/api_route.dart';
import '../config/cache_stroage/localStroage.dart';
import '../helper/helper.dart';
import '../model/adminRes.dart';
import '../view/manage/businessSettings/about/aboutUsScreen.dart';
import '../view/manage/businessSettings/currency/home.dart';
import '../view/manage/businessSettings/faq/faq.dart';
import '../view/manage/businessSettings/privacy/privacy.dart';
import '../view/manage/businessSettings/sellerSettings/sellerSettings.dart';
import '../view/manage/businessSettings/terms/terms.dart';
import '../view/dashboard/redirectScreen.dart';

class BusinessSettingController extends GetxController {
  late DIO.Dio dio;

  List<Map<String, dynamic>> busisnessGrid = [
    {
      "Currency": Icons.currency_exchange_rounded,
      'info': 'View and manage currency of website product price.',
      'route': CurrencyHome.routeName,
    },
    {
      "About Us": Icons.info_outline_rounded,
      'info': 'Learn more about our company, mission, and values. Get insights into our journey.',
      'route': AboutUs.routeName,
    },
    {
      "Terms and Condition": Icons.quick_contacts_dialer,
      'info': 'Read and agree to our terms and conditions to ensure smooth transactions.',
      'route': TermsAndConditions.routeName,
    },
    {
      "Privacy Policy": Icons.privacy_tip,
      'info': 'Understand how we handle your data and ensure your privacy and security.',
      'route': PrivacyPolicy.routeName,
    },
    {
      "Seller Settings": Icons.sell,
      'info': 'Customize your seller settings to optimize your selling experience.',
      'route': SellerSettings.routeName,
    },
    {
      "FAQ": Icons.question_mark,
      'info': 'Find answers to commonly asked questions. Get support and guidance.',
      'route': FAQScreen.routeName,
    }
  ];


  @override
  onInit() {
    DIO.BaseOptions options = DIO.BaseOptions(
        baseUrl: BASE_URL,
        connectTimeout: const Duration(minutes: 2),
        receiveTimeout: const Duration(minutes: 2));
    dio = DIO.Dio(options);
    // _dio.interceptors.add(RetryInterceptor(dio: _dio));
    dio.interceptors.add(RetryOnConnectionChangeInterceptor(
        requestRetrier:
            ConnectiveRequestRetrier(connectivity: Connectivity(), dio: dio)));
    super.onInit();
  }
}
