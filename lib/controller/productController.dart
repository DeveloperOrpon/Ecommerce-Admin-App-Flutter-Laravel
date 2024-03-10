import 'dart:developer';

import 'package:ashique_admin_app/controller/homeController.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as DIO;
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../config/api/Interceptors/ConnectivityRequestRetrier.dart';
import '../config/api/Interceptors/RetryOnConnectionChangeIntercptor.dart';
import '../config/api/api_route.dart';
import '../helper/helper.dart';
import '../model/Category.dart';
import '../model/productRes.dart';

class ProductController extends GetxController {
  late DIO.Dio dio;
  RxList<CategoryModel> allCategoryList = RxList<CategoryModel>([]);
  RxList<ProductModel> allProduct = RxList<ProductModel>([]);
  RxList<ProductModel> bestSellingProduct = RxList<ProductModel>([]);

  RefreshController refreshControllerCategory =
  RefreshController(initialRefresh: false);
  void onRefreshProduct() async{
    productPage=1;
    allProduct.value=[];
    await getAllProducts();
    refreshControllerCategory.refreshCompleted();
  }
  void onLoadingProduct() async{
    productPage++;
    log("onLoadingProduct: ${productPage}");
    await getAllProducts();
    refreshControllerCategory.loadComplete();
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
    productPage=1;
    getAllCategories();
    getAllProducts();
    getBestSelling();
    ///init value
  }
  Future<bool> getAllCategories() async {
    String url="$CATEGORIES_URL?paginate-1";
    try {
      final DIO.Response response = await dio.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> categoriesRes = response.data;
        CategoryRes categoryRes = CategoryRes.fromJson(categoriesRes);
        allCategoryList.value = categoryRes.data??[];
      }
      printLog('getAllCategories: ${allCategoryList.value.length}');
      return true;
    } on DIO.DioException catch (e) {
      log(e.toString());
      log(e.requestOptions.baseUrl + e.requestOptions.path);
      return false;
    }
  }
  int productPage=1;
  Future<bool> getAllProducts() async {
    String url="$PRODUCT_URL?per_page=10&page=$productPage";
    try {
      final DIO.Response response = await dio.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> productsResMap = response.data;
        ProductRes productRes = ProductRes.fromJson(productsResMap);
        if(productPage==1){
          allProduct.value = productRes.products??[];
        }else{
          List<ProductModel> temp= allProduct.value;
          temp.addAll(productRes.products??[]);
          allProduct.value=[];
          allProduct.value=temp;
        }
      }
      printLog('getAllProducts: ${response.requestOptions.baseUrl+url}');
      printLog('getAllProducts: ${allProduct.value.length}');
      return true;
    } on DIO.DioException catch (e) {
      log(e.toString());
      log(e.requestOptions.baseUrl + e.requestOptions.path);
      return false;
    }
  }
  Future<bool> getBestSelling() async {
    String url=BEST_SELLING_URL;
    try {
      final DIO.Response response = await dio.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> productsResMap = response.data;
        printLog("BestSelling:$productsResMap");
        ProductRes productRes = ProductRes.fromJson(productsResMap);
        bestSellingProduct.value = productRes.products??[];
        Get.put(HomeController()).controller.value = Gallery3DController(
            itemCount: bestSellingProduct.value.length, autoLoop: true, ellipseHeight: 0, minScale: 0.4);
      }
      return true;
    } on DIO.DioException catch (e) {
      log(e.toString());
      log(e.requestOptions.baseUrl + e.requestOptions.path);
      return false;
    }
  }
}
