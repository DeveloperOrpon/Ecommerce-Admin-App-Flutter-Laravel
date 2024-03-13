import 'dart:developer';
import 'dart:io';

import 'package:ashique_admin_app/model/Brand.dart';
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

class BrandController extends GetxController {
  late DIO.Dio dio;
  Rxn<File> selectBrandThumbnail = Rxn<File>();
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  final formKey = GlobalKey<FormBuilderState>();
  void onRefresh() async {
    page = 1;
    allBrand.value = [];
    await getAllBrand();
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    page++;
    await getAllBrand();
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
    getAllBrand();
  }

  int page = 1;
  RxList<Brand> allBrand = RxList<Brand>([]);

  /// all brand information
  Future<bool> getAllBrand() async {
    String url = "$BRAND_URL?page=$page";
    try {
      final DIO.Response response = await dio.get(url);
      Map<String, dynamic> brandsMap = response.data;
      printLog(
          "${response.requestOptions.baseUrl}${response.requestOptions.path}");
      BrandRes brandRes = BrandRes.fromJson(brandsMap);
      if (page == 1) {
        allBrand.value = brandRes.data ?? [];
      } else {
        List<Brand> temp = allBrand.value;
        temp.addAll(brandRes.data ?? []);
        log("int:${brandRes.data!.length}----${temp.length}");
        allBrand.value = [];
        allBrand.value = temp;
      }
      return true;
    } on DIO.DioException catch (e) {
      log(e.toString());
      log(e.requestOptions.baseUrl + e.requestOptions.path);
      return false;
    }
  }

  ///create a brand

  Future<bool> addBrand(String name) async {
    String url = BRAND_URL;
    try {
      var formData = DIO.FormData.fromMap({
        "name": name,
      });
      formData.files.add(MapEntry(
        'image',
        await DIO.MultipartFile.fromFile(selectBrandThumbnail.value!.path),
      ));
      final DIO.Response response = await dio.post(url, data: formData);
      page = 1;
      getAllBrand();
      return true;
    } on DIO.DioException catch (e) {
      log(e.toString());
      log(e.requestOptions.baseUrl + e.requestOptions.path);
      return false;
    }
  }
  ///update a brand

  Future<bool> updateBrand({
   required String name,
   required String id,

  }) async {
    String url = "$BRAND_URL/$id";
    try {
      var formData = DIO.FormData.fromMap({
        "name": name,
      });
     if(selectBrandThumbnail.value!=null) {
       formData.files.add(MapEntry(
        'image',
        await DIO.MultipartFile.fromFile(selectBrandThumbnail.value!.path),
      ));
     }
      final DIO.Response response = await dio.post(url, data: formData);
      page = 1;
      getAllBrand();
      return true;
    } on DIO.DioException catch (e) {
      log(e.toString());
      log(e.requestOptions.baseUrl + e.requestOptions.path);
      return false;
    }
  }  ///delete a brand

  Future<bool> deleteBrand({required String id,
  }) async {
    String url = "$BRAND_URL/$id";
    try {
      final DIO.Response response = await dio.delete(url);
      page = 1;
      getAllBrand();
      return true;
    } on DIO.DioException catch (e) {
      log(e.toString());
      log(e.requestOptions.baseUrl + e.requestOptions.path);
      return false;
    }
  }
}
