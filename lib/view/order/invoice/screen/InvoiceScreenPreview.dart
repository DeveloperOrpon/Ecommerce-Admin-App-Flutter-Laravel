
import 'package:ashique_admin_app/model/orderRes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:printing/printing.dart';

import '../helper/FileSaveHelper.dart';


class InvoiceScreenPreview extends StatelessWidget {
  final OrderModel orderResModel;
  const InvoiceScreenPreview({super.key, required this.orderResModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
        title:  Text(
          'Order Invoice #${orderResModel.id}',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      // appBar: appBarComponent(title: "Invoice (Pending)", onTap: (){
      //   Get.back();
      // }),
      body: PdfPreview(
        previewPageMargin: EdgeInsets.zero,
        actionBarTheme: PdfActionBarTheme(
          backgroundColor: Theme.of(context).primaryColor,
        ),
        // loadingWidget: const CupertinoActivityIndicator(radius: 18),
        canChangeOrientation: false,
        canChangePageFormat: false,
        canDebug: false,
        build: (_) => makePdf(context,orderResModel,orderResModel.customer! ),
      ),
    );
  }
}
