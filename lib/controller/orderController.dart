import 'dart:developer';

import 'package:ashique_admin_app/model/orderRes.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart' as DIO;
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../config/api/Interceptors/ConnectivityRequestRetrier.dart';
import '../config/api/Interceptors/RetryOnConnectionChangeIntercptor.dart';
import '../config/api/api_route.dart';

class OrderController extends GetxController {
  RxBool isLoadingOrder = RxBool(false);
  RxString orderStatusFilter = RxString('All');
  RxString orderFilterValue = RxString('OverAll');
  RxString selectOrderStatus = RxString('');
  RxString selectPaymentStatus = RxString('');
  List<String> orderGrid = [
    'All',
    'Pending',
    'Confirmed',
    'Processing',
    'Shipped',
    'Delivered',
    'Rejected',
    'Cancelled',
    'Returned',
    'Failed',
  ];
  List<String> orderStatus = [
    'Pending',
    'Confirmed',
    'Processing',
    'Shipped',
    'Delivered',
    'Returned',
    'Rejected',
    'Cancelled',
    'Failed',
  ];
  List<String> shippingStatus = [
    'Pending',
    'Confirmed',
    'Processing',
    'Shipped',
    'Delivered',
    'Rejected',
    'Returned',
    'Cancelled',
    'Failed',
  ];
  List<String> paymentStatus = [
    'Pending',
    'Paid',
    'Unpaid',
  ];
  List<String> orderFilter = [
    'OverAll',
    'Today',
    'Yesterday',
    'This Week',
    'Last Week',
    'This Month',
    'Last Month',
    'This Year'
  ];
  late DIO.Dio dio;

  RxList<OrderModel> allOrderList = RxList<OrderModel>([]);

  RefreshController refreshControllerOrder =
      RefreshController(initialRefresh: false);

  void onRefreshOrder() async {
    orderPage = 1;
    allOrderList.value = [];
    await getAllOrder();
    refreshControllerOrder.refreshCompleted();
  }

  void onLoadingOrder() async {
    orderPage++;
    log("onLoadingProduct: ${orderPage}");
    await getAllOrder();
    refreshControllerOrder.loadComplete();
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
    getAllOrder();
  }

  int orderPage = 1;

  Future<bool> getAllOrder() async {
    isLoadingOrder.value = true;
    String url = "$ORDER_URL?page=$orderPage";
    if (orderStatusFilter.value != 'All') {
      url = "$url&order_status=${orderStatusFilter.value}";
    }
    if (orderFilterValue.value != 'OverAll') {
      url += "&date=${orderFilterValue.value.replaceAll(' ', '').toLowerCase()}";
    }
    try {
      final DIO.Response response = await dio.get(url);
      if (response.statusCode == 200) {
        log("OrderUrl : ${response.requestOptions.baseUrl}${response.requestOptions.path}");
        Map<String, dynamic> productsResMap = response.data;
        OrderRes orderRes = OrderRes.fromJson(productsResMap);
        if (orderPage == 1) {
          allOrderList.value = orderRes.data ?? [];
        } else {
          List<OrderModel> temp = allOrderList.value;
          temp.addAll(orderRes.data ?? []);
          allOrderList.value = [];
          allOrderList.value = temp;
        }
      }
      isLoadingOrder.value = false;
      return true;
    } on DIO.DioException catch (e) {
      isLoadingOrder.value = false;
      log(e.toString());
      log(e.requestOptions.baseUrl + e.requestOptions.path);
      return false;
    }
  }

  Future<bool> updateOrderStatus(String id) async {
    String url="$ORDER_URL/$id";
    try {
      Map<String,dynamic>updateMap={
        "order_status":selectOrderStatus.value
      };
      final DIO.Response response = await dio.post(url,data: updateMap);
      log("Message: ${response.data}");
      int orderPage = 1;
      getAllOrder();
      return true;
    } on DIO.DioException catch (e) {
      log(e.toString());
      log(e.requestOptions.baseUrl + e.requestOptions.path);
      return false;
    }
  }
  Future<bool> updatePaymentStatus(String id) async {
    String url="$ORDER_URL/payment/$id";
    try {
      Map<String,dynamic>updateMap={
        "payment_status":selectPaymentStatus.value
      };
      final DIO.Response response = await dio.post(url,data: updateMap);
      log("Message: ${response.data}");
      int orderPage = 1;
      getAllOrder();
      return true;
    } on DIO.DioException catch (e) {
      log(e.toString());
      log(e.requestOptions.baseUrl + e.requestOptions.path);
      return false;
    }
  }
  Future<OrderModel?> orderDetails(String id) async {
    String url="$ORDER_URL/$id";
    try {
      final DIO.Response response = await dio.get(url);
      Map<String, dynamic> orderMap = response.data;
      OrderModel orderModel = OrderModel.fromJson(orderMap['data']);
      return orderModel;
    } on DIO.DioException catch (e) {
      log(e.toString());
      log(e.requestOptions.baseUrl + e.requestOptions.path);
      return null;
    }
  }
}
