import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../order/OrderTile.dart';

class CustomerOrder extends StatelessWidget {
  const CustomerOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController=TextEditingController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
        title: const Text(
          'Customer ID#11',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 5),
            child: SearchBar(
              controller: searchController,
              elevation: MaterialStatePropertyAll(0),
              leading: const Icon(CupertinoIcons.search),
              hintText: 'Search ID',
              textStyle:
                  const MaterialStatePropertyAll(TextStyle(fontSize: 16)),
              hintStyle: const MaterialStatePropertyAll(
                  TextStyle(color: Colors.grey, fontSize: 14)),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
              backgroundColor: MaterialStatePropertyAll(Colors.grey.shade100),
              trailing:[
                IconButton(
                  onPressed: searchController.clear,
                  icon: Icon(Icons.clear),
                ),
              ] ,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: OrderTile(),
                        ),
                    childCount: 10))
          ],
        ),
      ),
    );
  }
}
