import 'package:ashique_admin_app/config/appConst.dart';
import 'package:ashique_admin_app/model/orderRes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:intl/intl.dart';

import '../../../../helper/helper.dart';

Future<Uint8List> makePdf(BuildContext context, OrderModel orderResModel,
    CustomerModel userModel) async {
  var format = NumberFormat.simpleCurrency(locale: 'bn');
  printLog(format.currencySymbol);
  final pdf = pw.Document(pageMode: PdfPageMode.fullscreen);
  final ByteData bytes = await rootBundle.load('assets/logo/pinterest.png');
  final Uint8List byteList = bytes.buffer.asUint8List();
  ///pw.MultiPage
  pdf.addPage(pw.Page(
      margin: const pw.EdgeInsets.symmetric(horizontal: 30),
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Row(mainAxisAlignment: pw.MainAxisAlignment.center, children: [
                pw.Header(
                  text: "Invoice",
                  level: 1,
                ),
              ]),
              pw.SizedBox(height: 10),
              // pw.Image(NetworkImage(url),width: 50,height: 50),
              pw.Image(pw.MemoryImage(byteList),width: 50,height: 50),
              pw.Text("${appName}",
                  style: pw.TextStyle(
                      fontSize: 24, fontWeight: pw.FontWeight.bold)),
              pw.Text("admin@gmail.com",
                  style: pw.TextStyle(
                    fontSize: 16,
                    fontWeight: pw.FontWeight.normal,
                    color: PdfColors.black,
                  )),
              pw.SizedBox(height: 40),
              pw.RichText(
                  text: pw.TextSpan(children: [
                pw.TextSpan(
                    text: 'Order ID : ',
                    style: pw.TextStyle(
                      fontSize: 16,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.black,
                    )),
                pw.TextSpan(
                    text: '${orderResModel.id}',
                    style: pw.TextStyle(
                      fontSize: 16,
                      fontWeight: pw.FontWeight.normal,
                      color: PdfColors.black,
                    ))
              ])),
              pw.SizedBox(height: 40),
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('${userModel.fName} ${userModel.lName} ',
                        style: pw.TextStyle(
                          fontSize: 16,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.black,
                        )),
                    pw.Text('Order Date : ${orderResModel.dateCreated} ',
                        style: pw.TextStyle(
                          fontSize: 14,
                          fontWeight: pw.FontWeight.normal,
                          color: PdfColors.black,
                        )),
                  ]),
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('${userModel.email} ',
                        style: pw.TextStyle(
                          fontSize: 16,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.black,
                        )),
                    pw.Text('Update Date : ${orderResModel.dateModified} ',
                        style: pw.TextStyle(
                          fontSize: 14,
                          fontWeight: pw.FontWeight.normal,
                          color: PdfColors.black,
                        )),
                  ]),
              pw.SizedBox(height: 10),
              pw.Divider(color: PdfColors.grey),
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('Status ',
                        style: pw.TextStyle(
                          fontSize: 16,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.black,
                        )),
                    pw.Text('${(orderResModel.status)} ',
                        style: pw.TextStyle(
                          fontSize: 14,
                          fontWeight: pw.FontWeight.normal,
                          color: PdfColors.black,
                        )),
                  ]),
              pw.SizedBox(height: 20),
              pw.Text('Products ',
                  style: pw.TextStyle(
                    fontSize: 18,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.black,
                  )),
              pw.SizedBox(height: 10),
              ...List.generate(
                orderResModel.lineItems!.length,
                (index) => pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Expanded(
                        flex: 4,
                        child: pw.Text(
                            maxLines: 1,
                            '${index + 1} ${orderResModel.lineItems![index].name}',
                            style: pw.TextStyle(
                              fontSize: 14,
                              fontWeight: pw.FontWeight.normal,
                              color: PdfColors.black,
                            ))),
                    pw.Expanded(
                        flex: 1,
                        child: pw.Padding(
                            child: pw.Divider(color: PdfColors.grey),
                            padding:
                                const pw.EdgeInsets.symmetric(horizontal: 10))),
                    pw.Text(
                        'Qty(${orderResModel.lineItems![index].quantity}) - ${(orderResModel.lineItems![index].total)?.toStringAsFixed(2)} ${format.currencyName} ',
                        style: pw.TextStyle(
                          fontSize: 14,
                          fontWeight: pw.FontWeight.normal,
                          color: PdfColors.black,
                        ))
                  ],
                ),
              ),
              pw.SizedBox(height: 5),

              pw.Divider(color: PdfColors.grey),
              pw.SizedBox(height: 5),
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('Total Amount ',
                        style: pw.TextStyle(
                          fontSize: 16,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.black,
                        )),
                    pw.Text('${orderResModel.total} ${format.currencyName} ',
                        style: pw.TextStyle(
                          fontSize: 16,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.black,
                        )),
                  ]),
              pw.Expanded(
                  child: pw.Center(
                      child: pw.Text("dfgss",
                          style: pw.TextStyle(
                            fontSize: 14,
                            fontWeight: pw.FontWeight.normal,
                            color: PdfColors.black,
                          ))))
            ]);
      }));
  return pdf.save();
}
