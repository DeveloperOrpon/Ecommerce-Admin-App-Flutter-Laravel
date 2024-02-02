import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductQtyUi extends StatefulWidget {
  const ProductQtyUi({super.key});

  @override
  State<ProductQtyUi> createState() => _ProductQtyUiState();
}

class _ProductQtyUiState extends State<ProductQtyUi> {
  int qty = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 6,
        right: 10,
      ),
      height: 35,
      width: Get.width * .3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.grey,
          )),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  qty++;
                });
              },
              child: Icon(CupertinoIcons.minus),
            ),
          ),
          Container(
            width: 1,
            color: Colors.grey,
          ),
          Expanded(
            child: Center(
              child: Text(
                qty.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            width: 1,
            color: Colors.grey,
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  qty++;
                });
              },
              child: Icon(CupertinoIcons.add),
            ),
          ),
        ],
      ),
    );
  }
}
