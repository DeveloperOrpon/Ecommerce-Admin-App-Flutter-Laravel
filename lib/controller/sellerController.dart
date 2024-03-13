import 'dart:developer';
import 'dart:io';

import 'package:ashique_admin_app/model/Brand.dart';
import 'package:ashique_admin_app/model/sellerModelRes.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as DIO;
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../config/api/Interceptors/ConnectivityRequestRetrier.dart';
import '../config/api/Interceptors/RetryOnConnectionChangeIntercptor.dart';
import '../config/api/api_route.dart';
import '../helper/helper.dart';
import '../model/productRes.dart';

class SellerController extends GetxController {
  late DIO.Dio dio;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  void onRefresh() async {
    page = 1;
    allSeller.value=[];
    await getSellers();
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    page++;
    await getSellers();
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
    getSellers();
  }

  int page = 1;
  RxList<SellerModel> allSeller = RxList<SellerModel>([]);

  /// all brand information
  Future<bool> getSellers() async {
    String url = "$SELLER_URL?page=$page";
    try {
      final DIO.Response response = await dio.get(url);
      Map<String, dynamic> sellerMap = response.data;
      printLog(
          "${response.requestOptions.baseUrl}${response.requestOptions.path}");
      SellerModelRes sellerRes = SellerModelRes.fromJson(sellerMap);
      if (page == 1) {
        allSeller.value = sellerRes.data ?? [];
      } else {
        List<SellerModel> temp = allSeller.value;
        temp.addAll(sellerRes.data ?? []);
        log("int:${sellerRes.data!.length}----${temp.length}");
        allSeller.value = [];
        allSeller.value = temp;
      }
      return true;
    } on DIO.DioException catch (e) {
      log(e.toString());
      log(e.requestOptions.baseUrl + e.requestOptions.path);
      return false;
    }
  }
}
