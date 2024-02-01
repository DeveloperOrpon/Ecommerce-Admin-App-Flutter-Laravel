import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';

Future<List<File>?> pickImage(
    {bool multiImage = false, required BuildContext context}) async {
  final ImagePicker picker = ImagePicker();
  if (multiImage) {
    List<File> selectImages = [];
    final List<XFile> images = await picker.pickMultiImage();
    if (images.isNotEmpty) {
      images.forEach((element) {
        var file = File(element.path);
        selectImages.add(file);
      });
    }
    return selectImages;
  }
  List<File> selectImages = [];
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  if (image == null) {
    return null;
  } else {

    selectImages.add(File(image.path));
  }
  return selectImages;
}
