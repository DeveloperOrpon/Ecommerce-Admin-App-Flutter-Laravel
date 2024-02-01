import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
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
import '../view/screen/redirectScreen.dart';

class AuthenticationController extends GetxController {
  late DIO.Dio dio;
  Rxn<AdminRes> adminRes = Rxn<AdminRes>();
  final loginFormKey = GlobalKey<FormBuilderState>();

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

    ///init value
  }

  ///login
  Future<bool> loginWithEmailPassword(
      String email, String password, BuildContext context) async {
    // startLoading("Please Wait...");
    printLog("email :$email password -$password");
    final userInformation = {"email": email, "password": password};
    log("${dio.options.baseUrl}$LOGIN_ADMIN");
    try {
      final DIO.Response response = await dio.post(LOGIN_ADMIN,
          data: DIO.FormData.fromMap(userInformation));
      printLog('Res: ${response.data}');
      if (response.statusCode == 200) {
        Map<String, dynamic> messageRes = response.data;
        AdminRes adminResTemp = AdminRes.fromJson(messageRes);
        LocalStorage.savedUserInformation(json.encode(adminResTemp.toJson()));
        LocalStorage.savedJWT(adminResTemp.data!.accessToken.toString());
        adminRes.value = adminResTemp;
      }
      return true;
    } on DIO.DioException catch (e) {
      EasyLoading.dismiss();
      log(e.toString());
      log(e.requestOptions.baseUrl + e.requestOptions.path);
      log(e.requestOptions.data.toString());
      return false;
    }
  }

  ///SIGNUP USER
  ///LOGOUT
  logout() {
    LocalStorage.savedJWT("");
    LocalStorage.savedUserInformation('');
    EasyLoading.dismiss();
    Get.offAll(const RedirectScreen(), transition: Transition.fadeIn);
  }
}
