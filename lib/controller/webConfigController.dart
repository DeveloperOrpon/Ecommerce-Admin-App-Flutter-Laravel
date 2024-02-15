import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as DIO;
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../config/api/Interceptors/ConnectivityRequestRetrier.dart';
import '../config/api/Interceptors/RetryOnConnectionChangeIntercptor.dart';
import '../config/api/api_route.dart';
import '../helper/helper.dart';
import '../model/productRes.dart';

class WebConfigController extends GetxController {
  late DIO.Dio dio;
  Rxn<File> webLogo= Rxn<File>();
  Rxn<File> mobileLogo= Rxn<File>();
  Rxn<File> webFooterLogo= Rxn<File>();
  Rxn<File> favIcon= Rxn<File>();
  RefreshController refreshController =
  RefreshController(initialRefresh: false);
  void onRefresh() async{
    await Future.delayed(Duration(milliseconds: 1000));
    refreshController.refreshCompleted();
  }
  void onLoading() async{
    await Future.delayed(Duration(milliseconds: 1000));
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
  }
}
