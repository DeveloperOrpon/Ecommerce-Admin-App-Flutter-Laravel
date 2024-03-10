import 'dart:developer';
import 'dart:io';
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

class BannerController extends GetxController {
  Rxn<File> selectBannerImage = Rxn<File>();
  final uploadKey = GlobalKey<FormBuilderState>();
  late DIO.Dio dio;

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
    getBanner();
  }

  RxList<BannerModel> bannerList = RxList<BannerModel>([]);
  RxList<BannerModel> mainList = RxList<BannerModel>([]);
  RxList<BannerModel> popUpList = RxList<BannerModel>([]);

  RefreshController refreshControllerBanner =
  RefreshController(initialRefresh: false);

  void onRefreshBanner() async {
    mainList.value=[];
    popUpList.value=[];
    getBanner();
    refreshControllerBanner.refreshCompleted();
  }
  void onLoadingBanner() async {
    refreshControllerBanner.loadComplete();
  }

  Future<bool> addBanner(String urlLink, String type) async {
    String url = BANNER_URL;
    try {
      var formData = DIO.FormData.fromMap({
        "url": urlLink,
        "banner_type": type,
      });
      formData.files.add(MapEntry(
        'image',
        await DIO.MultipartFile.fromFile(selectBannerImage.value!.path),
      ));
      final DIO.Response response = await dio.post(url, data: formData);
      getBanner();
      return true;
    } on DIO.DioException catch (e) {
      log(e.toString());
      log(e.requestOptions.baseUrl + e.requestOptions.path);
      return false;
    }
  }

  Future<bool> getBanner() async {
    String url = BANNER_URL;
    try {
      final DIO.Response response = await dio.get(url);
      Map<String, dynamic> bannerMap = response.data;
      BannerRes bannerRes = BannerRes.fromJson(bannerMap);
      bannerList.value = bannerRes.data ?? [];
      mainList.value = (bannerRes.data ?? [])
          .where((element) => element.bannerType == "Main Banner")
          .toList();
      popUpList.value = (bannerRes.data ?? [])
          .where((element) => element.bannerType == "Popup Banner")
          .toList();
      return true;
    } on DIO.DioException catch (e) {
      log(e.toString());
      log(e.requestOptions.baseUrl + e.requestOptions.path);
      return false;
    }
  }

  Future<bool> deleteBanner(String id) async {
    String url = "${BANNER_URL}/$id";
    try {
      final DIO.Response response = await dio.delete(url);
      getBanner();
      return true;
    } on DIO.DioException catch (e) {
      log(e.toString());
      log(e.requestOptions.baseUrl + e.requestOptions.path);
      return false;
    }
  }

  Future<bool> updateStatus(String id, bool publish) async {
    String url = "$BANNER_URL/$id";
    try {
      Map<String, dynamic> bannerMap = {"status": "${publish ? 1 : 0}"};
      log("${bannerMap}");
      final DIO.Response response = await dio.put(url, data: bannerMap);
      getBanner();
      return true;
    } on DIO.DioException catch (e) {
      log(e.toString());
      log(e.requestOptions.baseUrl + e.requestOptions.path);
      return false;
    }
  }
}
