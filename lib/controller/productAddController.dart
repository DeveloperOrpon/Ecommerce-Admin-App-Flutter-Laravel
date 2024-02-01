import 'dart:io';

import 'package:get/get.dart';

class ProductAddController extends GetxController {
  Rx<Map<String, dynamic>> pickColors = Rx<Map<String, dynamic>>({});
  RxList sizeList = RxList([]);
  RxList<File> productImages = RxList<File>([]);
  Rxn<File> selectProductThumbnail= Rxn<File>();
  Rxn<File> selectCategoryThumbnail= Rxn<File>();
  RxList<String> selectedCategory = RxList([]);
  RxList<String> allCategories = RxList([
    'News',
    'Entertainment',
    'Politics',
    'Automotive',
    'Sports',
    'Education',
    'Fashion',
    'Travel',
    'Food',
    'Tech',
    'Science',
  ]);
}
