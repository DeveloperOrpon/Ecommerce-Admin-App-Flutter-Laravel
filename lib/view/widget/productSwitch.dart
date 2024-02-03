import 'package:flutter/material.dart';
import 'package:load_switch/load_switch.dart';

class ProductSwitch extends StatefulWidget {
  const ProductSwitch({super.key});

  @override
  State<ProductSwitch> createState() => _ProductSwitchState();
}

class _ProductSwitchState extends State<ProductSwitch> {
  bool value = true;

  Future<bool> _getFuture() async {
    await Future.delayed(const Duration(seconds: 2));
    return !value;
  }
  @override
  Widget build(BuildContext context) {
    return LoadSwitch(
      height:28,
      width: 60,
      thumbSizeRatio: .9,
      spinStrokeWidth:1,
      value: value,
      future: _getFuture,
      onChange: (v) {
        value = v;
        print('Value changed to $v');
        setState(() {});
      },
      onTap: (v) {
        print('Tapping while value is $v');
      },
    );
  }
}
