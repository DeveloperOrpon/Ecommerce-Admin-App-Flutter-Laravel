import 'dart:developer';
import 'dart:io';
import 'package:ashique_admin_app/helper/helper.dart';
import 'package:ashique_admin_app/model/Banner.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart' as DIO;
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../config/api/Interceptors/ConnectivityRequestRetrier.dart';
import '../config/api/Interceptors/RetryOnConnectionChangeIntercptor.dart';
import '../config/api/api_route.dart';
import '../model/CustomerModel.dart';

class CustomerController extends GetxController {
  final searchController = TextEditingController();
  final uploadKey = GlobalKey<FormBuilderState>();
  late DIO.Dio dio;
  RxList<CustomerModel> customerList = RxList<CustomerModel>([]);

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
    getCustomer();
  }

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  void onRefresh() async {
    page=1;
    customerList.value=[];
    await getCustomer();
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    page++;
    await getCustomer();
    refreshController.loadComplete();
  }

  int page=1;
  Future<bool> getCustomer() async {
    String url = "$CUSTOMER_URL?page=$page";

    try {
      final DIO.Response response = await dio.get(url);
      Map<String, dynamic> customerMap = response.data;
      printLog("${response.requestOptions.baseUrl}${response.requestOptions.path}");
      CustomerRes customerRes = CustomerRes.fromJson(customerMap);
      printLog("${customerRes.data!.length}");
      if(page==1){
        customerList.value=customerRes.data??[];
      }else{
        List<CustomerModel> temp = customerList.value;
        temp.addAll(customerRes.data ?? []);
        log("int:${customerRes.data!.length}----${temp.length}");
        customerList.value = [];
        customerList.value = temp;
      }
      return true;
    } on DIO.DioException catch (e) {
      log(e.toString());
      log(e.requestOptions.baseUrl + e.requestOptions.path);
      return false;
    }
  }
}
