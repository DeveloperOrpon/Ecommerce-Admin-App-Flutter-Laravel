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
import '../model/SupportTicketRes.dart';
import '../model/messages.dart';
import '../model/productRes.dart';

class SupportController extends GetxController {
  late DIO.Dio dio;
  Rxn<File> selectBrandThumbnail = Rxn<File>();
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  void onRefresh() async {
    allSupportTickets.value = [];
    page = 1;
    await getAllSupportTicket();
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    page++;
    await getAllSupportTicket();
    refreshController.loadComplete();
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
    getAllSupportTicket();
  }

  int page = 1;
  RxList<SupportTicketModel> allSupportTickets = RxList<SupportTicketModel>([]);

  /// all brand information
  Future<bool> getAllSupportTicket() async {
    String url = "$SUPPORT_TICKET_URL?page=$page";
    try {
      final DIO.Response response = await dio.get(url);
      Map<String, dynamic> brandsMap = response.data;
      printLog(
          "${response.requestOptions.baseUrl}${response.requestOptions.path}");
      SupportTicketRes supportTicketRes = SupportTicketRes.fromJson(brandsMap);
      if (page == 1) {
        allSupportTickets.value = supportTicketRes.data ?? [];
      } else {
        List<SupportTicketModel> temp = allSupportTickets.value;
        temp.addAll(supportTicketRes.data ?? []);
        log("int:${supportTicketRes.data!.length}----${temp.length}");
        allSupportTickets.value = [];
        allSupportTickets.value = temp;
      }
      return true;
    } on DIO.DioException catch (e) {
      log(e.toString());
      log(e.requestOptions.baseUrl + e.requestOptions.path);
      return false;
    }
  }

  ////update status
  Future<bool> updateStatus({
    required String status,
    required String id,
  }) async {
    String url = "$SUPPORT_TICKET_URL/$id";
    try {
      var formData = {
        "status": status,
        "id": id,
      };
      final DIO.Response response = await dio.put(url, data: formData);
      printLog(
          "Url: ${response.requestOptions.baseUrl}${response.requestOptions.path}  \n ${response.requestOptions.data}");
      page = 1;
      getAllSupportTicket();
      return true;
    } on DIO.DioException catch (e) {
      log(e.toString());
      log(e.requestOptions.baseUrl + e.requestOptions.path);
      return false;
    }
  }

  Future<List<SupportMessageModel>> getSupportTicketCov(
      String id, String pageCov) async {
    String url = "$SUPPORT_TICKET_URL/conv/$id?page=$pageCov";
    try {
      final DIO.Response response = await dio.get(url);
      Map<String, dynamic> supportCovMap = response.data;
      log(response.requestOptions.baseUrl + response.requestOptions.path);
      SupportMessagesModelRes supportTicketRes =
          SupportMessagesModelRes.fromJson(supportCovMap);
      return supportTicketRes.data ?? [];
    } on DIO.DioException catch (e) {
      log(e.toString());
      log(e.requestOptions.baseUrl + e.requestOptions.path);
      return <SupportMessageModel>[];
    }
  }

  Future<bool> sendSupportTicketCov(
      String id, String adminId, String replay) async {
    String url = "$SUPPORT_TICKET_URL/conv";
    try {
      Map<String, dynamic> replyMap = {
        'id': id,
        "replay": replay,
        "adminId": adminId
      };
      final DIO.Response response = await dio.post(url, data: replyMap);
      return true;
    } on DIO.DioException catch (e) {
      log(e.toString());
      log(e.requestOptions.baseUrl + e.requestOptions.path);
      return false;
    }
  }
}
