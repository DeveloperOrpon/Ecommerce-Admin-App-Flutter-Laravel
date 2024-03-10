import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as DIO;
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../config/api/Interceptors/ConnectivityRequestRetrier.dart';
import '../config/api/Interceptors/RetryOnConnectionChangeIntercptor.dart';
import '../config/api/api_route.dart';
import '../helper/helper.dart';
import '../model/couponRes.dart';
import '../model/productRes.dart';

class CouponController extends GetxController {
  List<String> couponType = ['Discount on Purchase'];
  List<String> discountType = ['Amount', 'Percentage'];
  final uploadKey = GlobalKey<FormBuilderState>();
  Rxn<DateTime> startTime = Rxn();
  Rxn<DateTime> expireTime = Rxn();
  late DIO.Dio dio;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  void onRefresh() async {
    page = 1;
    coupons.value = [];
    await getCoupon();
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    page++;
    await getCoupon();
    refreshController.loadComplete();
  }

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
    getCoupon();
  }

  int page = 1;
  RxList<CouponModel> coupons = RxList<CouponModel>([]);

  Future<bool> getCoupon() async {
    String url = "$COUPON_URL?page=$page";
    try {
      final DIO.Response response = await dio.get(url);
      Map<String, dynamic> couponMap = response.data;
      CouponRes couponRes = CouponRes.fromJson(couponMap);
      if (page == 1) {
        coupons.value = couponRes.data ?? [];
      } else {
        List<CouponModel> temp = coupons.value;
        temp.addAll(couponRes.data ?? []);
        log("int:${couponRes.data!.length}----${temp.length}");
        coupons.value = [];
        coupons.value = temp;
      }
      return true;
    } on DIO.DioException catch (e) {
      log(e.toString());
      log(e.requestOptions.baseUrl + e.requestOptions.path);
      return false;
    }
  }

 Future<bool> addCoupon(Map<String, dynamic> map) async {
    String url = COUPON_URL;
    try {
      final DIO.Response response = await dio.post(url,data: map);
      page=1;
      getCoupon();
      return true;
    } on DIO.DioException catch (e) {
      log(e.toString());
      log(e.requestOptions.baseUrl + e.requestOptions.path);
      return false;
    }
  }
}
