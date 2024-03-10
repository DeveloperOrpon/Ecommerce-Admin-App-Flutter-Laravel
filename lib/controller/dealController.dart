import 'dart:developer';
import 'dart:io';
import 'package:ashique_admin_app/helper/helper.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as DIO;
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../config/api/Interceptors/ConnectivityRequestRetrier.dart';
import '../config/api/Interceptors/RetryOnConnectionChangeIntercptor.dart';
import '../config/api/api_route.dart';
import '../model/flashDealProductRes.dart';
import '../model/flashSaleRes.dart';

class DealController extends GetxController {
  Rxn<File> selectDealImage = Rxn<File>();
  final uploadKey = GlobalKey<FormBuilderState>();
  late DIO.Dio dio;
  RxList<FlashProductModel> selectedFlashProduct=RxList([]);

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
    getAllFlashDeal();
  }

  int page = 1;
  RxList<FlashDealModel> allFlashDeal = RxList<FlashDealModel>([]);

  getAllFlashDeal() async {
    String url = FLASH_URL;
    try {
      final DIO.Response response = await dio.get(url);
      Map<String, dynamic> flashMap = response.data;
      FlashDealRes flashDealRes = FlashDealRes.fromJson(flashMap);
      if (page == 1) {
        allFlashDeal.value = flashDealRes.data ?? [];
      } else {
        List<FlashDealModel> temp = allFlashDeal.value;
        temp.addAll(flashDealRes.data ?? []);
        allFlashDeal.value = [];
        allFlashDeal.value = temp;
      }
      return true;
    } on DIO.DioException catch (e) {
      log(e.toString());
      log(e.requestOptions.baseUrl + e.requestOptions.path);
      return false;
    }
  }
  ///deal Product
 Future<List<FlashProductModel>> getFlashDealProduct(String id,String pageIndex) async {
    String url = "$FLASH_URL/$id?page=$pageIndex";
    try {
      final DIO.Response response = await dio.get(url);
      Map<String, dynamic> flashMap = response.data;
      FlashDealProductRes flashDealRes = FlashDealProductRes.fromJson(flashMap);
      return flashDealRes.data??[];
    } on DIO.DioException catch (e) {
      log(e.toString());
      log(e.requestOptions.baseUrl + e.requestOptions.path);
      return [];
    }
  }  ///deal Product
 Future<List<FlashProductModel>> searchFlashDealProduct(String query) async {
    String url = "$FLASH_URL/product/search?search=$query";
    try {
      final DIO.Response response = await dio.get(url);
      Map<String, dynamic> flashMap = response.data;
      FlashDealProductRes flashDealRes = FlashDealProductRes.fromJson(flashMap);
      return flashDealRes.data??[];
    } on DIO.DioException catch (e) {
      log(e.toString());
      log(e.requestOptions.baseUrl + e.requestOptions.path);
      return [];
    }
  }


  Future<bool> addFlashDealProduct(String id) async {
    String url = "$FLASH_URL/add/$id";
    try {
      List<int> ids=selectedFlashProduct.value.map((e) => e.id!).toList();

      Map<String,dynamic> mapProduct={
        "discount":"0",
        "discount_type":"",
        "product_ids":ids
      };
      printLog("Ids: ${ids}");
      final DIO.Response response = await dio.post(url,data: mapProduct);
      selectedFlashProduct.value=[];
      return true;
    } on DIO.DioException catch (e) {
      log(e.toString());
      log(e.requestOptions.baseUrl + e.requestOptions.path);
      return false;
    }
  }

  Future<bool> deleteFlashDealProduct(String id) async {
    String url = "$FLASH_URL/delete/$id";
    try {
      final DIO.Response response = await dio.delete(url);
      return true;
    } on DIO.DioException catch (e) {
      log(e.toString());
      log(e.requestOptions.baseUrl + e.requestOptions.path);
      return false;
    }
  }
}
