import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as DIO;

import '../config/api/Interceptors/ConnectivityRequestRetrier.dart';
import '../config/api/Interceptors/RetryOnConnectionChangeIntercptor.dart';
import '../config/api/api_route.dart';
import '../helper/helper.dart';
import '../model/productRes.dart';

class ProductController extends GetxController {
  late DIO.Dio dio;
  RxList<ProductModel> allProduct = RxList<ProductModel>([]);

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
    getAllProduct();
    ///init value
  }

  getAllProduct() async {
    String url=PRODUCT_URL+"?per_page=10";
    log("ProductUrl : ${dio.options.baseUrl}${url}");
    try {
      log("ProductUrl : ${BASE_URL+url}");
      final DIO.Response response = await dio.get(url);
      printLog('ProductUrlRes: ${response.data}');
      if (response.statusCode == 200) {
        Map<String, dynamic> productsRes = response.data;
        ProductRes productRes = ProductRes.fromJson(productsRes);
        allProduct.value = productRes.products??[];
      }
      return true;
    } on DIO.DioException catch (e) {
      log(e.toString());
      log(e.requestOptions.baseUrl + e.requestOptions.path);
      return false;
    }
  }
}
