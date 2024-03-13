import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';

import '../model/Category.dart';

class ProductAddController extends GetxController {
  Rx<Map<String, dynamic>> pickColors = Rx<Map<String, dynamic>>({});
  RxList sizeList = RxList([]);
  RxMap<String, List> selectedAttribute = RxMap<String, List>();
  RxList<File> productImages = RxList<File>([]);
  Rxn<File> selectProductThumbnail = Rxn<File>();
  Rxn<File> selectCategoryThumbnail = Rxn<File>();
  Rxn<CategoryModel> selectParentCategory = Rxn<CategoryModel>();
  RxList<String> selectedCategory = RxList([]);
  RxString productName = RxString('');
  RxString productPrice = RxString('');
  RxString productDescription = RxString('');
  final HtmlEditorController controller = HtmlEditorController();
  RxList<String> selectedVariant = RxList<String>([]);

  List<String> generateCombinations(
      List<String> colors, Map<String, List<dynamic>> attributes) {
    List<String> result = [];
    List<String> keysToRemove = [];
    for (var entry in attributes.entries) {
      if (entry.value.isEmpty) {
        keysToRemove.add(entry.key);
      }
    }

    for (var key in keysToRemove) {
      attributes.remove(key);
    }
    List<List<dynamic>> combinations = [];
    if (colors.isNotEmpty) combinations.add(colors);
    combinations.addAll(attributes.values.toList());
    log("Full: $combinations");
    if (combinations.isEmpty) return [];

    result = generateCombinationsDemo(combinations);
    result = removeFirstHyphen(result);
    log("generateCombinations : ${result.length}");
    log("generateCombinations : ${result}");
    selectedVariant.value = [];
    selectedVariant.value = result;
    return result;
  }

  List<String> removeFirstHyphen(List<String> elements) {
    List<String> modifiedElements = [];
    for (String element in elements) {
      if (element.startsWith('-')) {
        modifiedElements.add(element.substring(
            1)); // Remove the first character (hyphen) from the element
      } else {
        modifiedElements.add(
            element); // If element doesn't start with a hyphen, keep it unchanged
      }
    }
    return modifiedElements;
  }

  List<String> generateCombinationsDemo(List<List<dynamic>> arrays,
      [int index = 0, String current = '']) {
    if (index == arrays.length) {
      // Base case: if we've processed all arrays, add the current combination to the list of combinations
      return [current];
    }

    List<String> combinations = [];

    for (String item in arrays[index]) {
      // Recursively generate combinations for the next array
      combinations.addAll(generateCombinationsDemo(arrays, index + 1,
          '${current.trim().capitalize?.replaceAll(' ', '')}-$item'));
    }

    return combinations;
  }
}
