import 'package:flutter/material.dart';
import 'package:load_switch/load_switch.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final Function? onTap;

  const CustomSwitch({super.key, this.value = true, this.onTap});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool value = true;

  Future<bool> _getFuture() async {
    await Future.delayed(const Duration(seconds: 2));
    return !value;
  }

  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () {
        setState(() {
          value = widget.value;
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LoadSwitch(
      height: 25,
      width: 55,
      thumbSizeRatio: .9,
      spinStrokeWidth: 1,
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
