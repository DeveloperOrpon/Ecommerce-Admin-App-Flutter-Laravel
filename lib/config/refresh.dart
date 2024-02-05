import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

refreshLoading(BuildContext context) => WaterDropHeader(
      waterDropColor: Theme.of(context).primaryColor,
      refresh: const CupertinoActivityIndicator(
        color: Colors.black,
        radius: 15,
      ),
    );

var customFooter = CustomFooter(
  builder: (context, mode) {
    Widget body;
    if (mode == LoadStatus.idle) {
      body = const Text("Pull up load");
    } else if (mode == LoadStatus.loading) {
      body = const CupertinoActivityIndicator();
    } else if (mode == LoadStatus.failed) {
      body = const Text("Load Failed!Click retry!");
    } else if (mode == LoadStatus.canLoading) {
      body = const Text("release to load more");
    } else {
      body = const Text("No more Data");
    }
    return SizedBox(
      height: 55.0,
      child: Center(child: body),
    );
  },
);
