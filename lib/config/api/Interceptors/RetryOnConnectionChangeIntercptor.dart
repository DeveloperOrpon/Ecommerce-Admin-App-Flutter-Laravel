import 'dart:developer';
import 'dart:io';
import 'package:ashique_admin_app/controller/AuthenticationController.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as DIO;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../helper/helper.dart';
import '../../cache_stroage/localStroage.dart';
import 'ConnectivityRequestRetrier.dart';

class RetryOnConnectionChangeInterceptor extends Interceptor {
  final ConnectiveRequestRetrier requestRetrier;

  RetryOnConnectionChangeInterceptor({required this.requestRetrier});

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (_shouldRetry(err)) {
      // if(err.error is SocketException.)
      final ConnectivityResult connectivity=await Connectivity().checkConnectivity();
      if(connectivity!= ConnectivityResult.none){
        handler.reject(err);
        return;
      }

      // authenticationErrorDialog('Warning', "No Internet Connection. Turn On Connection.");
      log("Solved : ${err.error is SocketException} ${connectivity}");
      DIO.Response response = await requestRetrier.scheduleRequestRetry(err);

      handler.resolve(response);
    } else {
      log("message : No Network Error ${err.type == DioErrorType.connectionError}");
      // if(err.response.statusCode==)
      printLog("Status Code : ${err.response!.statusCode}");
      if(err.response!=null && err.response!.statusCode==401){
        Get.put(AuthenticationController()).logout();
        return;
      }
      if(err.response==null){
      }else{
        if(err.response!.data.runtimeType==String){
          // authenticationErrorDialog('Warning', err.response!.data??"Unknown Error Try Again");
        }else{

          Map<String, dynamic> messageRes = err.response!.data;
          String message=messageRes['message']??messageRes['msg']??"Error Happened";
          // authenticationErrorDialog('Warning', message.isEmpty?"Unknown Error Try Again":message);
        }
      }

    }
    // if(err.response!.statusCode==301)
    handler.next(err);
    super.onError(err, handler);
  }

  bool _shouldRetry(DioError err) {
    return err.type == DioErrorType.connectionError ||
        err.error is SocketException;
  }
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await LocalStorage.getJWT();
    if (token != null && token.isNotEmpty) {
      options.headers["Authorization"] = "Bearer $token";
    }
    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';
    super.onRequest(options, handler);
  }
}
