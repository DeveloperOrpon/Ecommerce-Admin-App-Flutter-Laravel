import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double height;
  const CustomDivider({super.key, this.height=10});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: height,
      color: Colors.grey.shade100,
    );
  }
}
