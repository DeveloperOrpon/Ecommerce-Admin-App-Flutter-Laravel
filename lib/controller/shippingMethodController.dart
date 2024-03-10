import 'dart:developer';

import 'package:ashique_admin_app/model/orderRes.dart';
import 'package:ashique_admin_app/model/shippingMethodRes.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart' as DIO;
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../config/api/Interceptors/ConnectivityRequestRetrier.dart';
import '../config/api/Interceptors/RetryOnConnectionChangeIntercptor.dart';
import '../config/api/api_route.dart';

class ShippingMethodController extends GetxController {
  late DIO.Dio dio;
  RxList<ShippingMethodModel> allShippingMethodModel =
      RxList<ShippingMethodModel>([]);

  final uploadKey = GlobalKey<FormBuilderState>();
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  void onRefresh() async {
    allShippingMethodModel.value = [];
    getShippingMethod();
    refreshController.refreshCompleted();
  }

  void onLoading() async {
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
    getShippingMethod();
  }

  Future<bool> getShippingMethod() async {
    String url = SHIPPING_METHOD_URL;
    try {
      final DIO.Response response = await dio.get(url);
      Map<String, dynamic> map = response.data;
      ShippingMethodRes shippingMethodRes = ShippingMethodRes.fromJson(map);
      allShippingMethodModel.value = shippingMethodRes.data ?? [];
      return true;
    } on DIO.DioException catch (e) {
      log(e.toString());
      log(e.requestOptions.baseUrl + e.requestOptions.path);
      return false;
    }
  }

  Future<bool> addShippingMethod(Map<String, dynamic> shippingMap) async {
    String url = SHIPPING_METHOD_URL;
    try {
      final DIO.Response response = await dio.post(url, data: shippingMap);
      getShippingMethod();
      return true;
    } on DIO.DioException catch (e) {
      log(e.toString());
      log(e.requestOptions.baseUrl + e.requestOptions.path);
      return false;
    }
  }
}
