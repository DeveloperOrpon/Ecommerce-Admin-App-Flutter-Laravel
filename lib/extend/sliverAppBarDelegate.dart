
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return  Material(
      color: Theme.of(context).primaryColor,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

List<String> generateCombinations(List size, List<String> colors) {
  List<String> result = [];

  for (String element1 in size) {
   if(colors.isNotEmpty){
     for (String element2 in colors) {
       result.add('$element1$element2');
     }
   }else{
     result.add('$element1');
   }
  }
  log("generateCombinations : ${result.length}");
  return result;
}