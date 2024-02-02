import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  RxString orderStatusFilter = RxString('All');
  RxString orderFilterValue = RxString('OverAll');
  List<String> orderGrid = [
    'All',
    'Pending',
    'Confirmed',
    'Processing',
    'Shipped',
    'Delivered',
    'Rejected',
    'Cancelled',
    'Failed',
  ]; List<String> orderStatus = [
    'Accepted',
    'Rejected',
    'Cancelled',
    'In Process',
    'Completed',
  ]; List<String> shippingStatus = [
    'Not Shipped',
    'Dispatch Ready',
    'Out for Delivery',
    'Delivery Failed',
    'Delivered',
    "Returned",
    'Ready For Pick Up',
    'Customer Pick-up',
    'Pick-up Failed'
  ]; List<String> paymentStatus = [
    'Pending',
    'Paid',
    'Not Paid',
    'Failed',
    'Refund Initiated',
    "Refunded",
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
}
