import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class DealController extends GetxController{
  Rxn<File> selectDealImage=Rxn<File>();
  final uploadKey = GlobalKey<FormBuilderState>();
}