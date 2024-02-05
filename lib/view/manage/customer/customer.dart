import 'package:ashique_admin_app/view/manage/customer/customerDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'model/dialog.dart';

class CustomerScreen extends StatefulWidget {
  static const String routeName = 'CustomerScreen';

  const CustomerScreen({super.key});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero,() {
      Navigator.of(context).restorablePush(infoDialog,
          arguments:
          'Tap the customer row in table for more details about customer');
    },);
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
          'Customer ',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).restorablePush(infoDialog,
                  arguments:
                      'Tap the customer row in table for more details about customer');
            },
            icon: Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: Icon(
                Icons.info,
                color: Theme.of(context).primaryColor,
                size: 30,
              ),
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(55),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 5),
            child: SearchBar(
              controller: searchController,
              elevation: MaterialStatePropertyAll(0),
              leading: const Icon(CupertinoIcons.search),
              hintText: 'Search Customer',
              textStyle:
                  const MaterialStatePropertyAll(TextStyle(fontSize: 16)),
              hintStyle: const MaterialStatePropertyAll(
                  TextStyle(color: Colors.grey, fontSize: 14)),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
              backgroundColor: MaterialStatePropertyAll(Colors.grey.shade100),
              trailing: [
                IconButton(
                  onPressed: searchController.clear,
                  icon: Icon(Icons.clear),
                ),
              ],
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            _userTile(context),
            _userTile(context),
            _userTile(context),
            _userTile(context),
            _userTile(context),
            _userTile(context),
            _userTile(context),
            _userTile(context),
            _userTile(context),
            _userTile(context),
            _userTile(context),
            _userTile(context),
          ]))
        ],
      ),
    );
  }

  Container _userTile(BuildContext context) {
    return Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade200,
                  width: 2,
                ), // You can customize this BorderSide as per your requirement
              ),
            ),
            child: ListTile(
              onTap: () {
                Get.to(const CustomerDetails(id: 3),
                    transition: Transition.fadeIn);
              },
              contentPadding: EdgeInsets.zero,
              title: Text(
                "Orpon Hasan",
                style: GoogleFonts.lobster(
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                'developeropon@gmail.com',
                style: GoogleFonts.ibmPlexMono(
                  fontSize: 12,
                  color: Colors.black45,
                ),
              ),
              trailing: Container(
                padding:
                    const EdgeInsetsDirectional.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).primaryColor.withOpacity(.2),
                ),
                child: Text(
                  '5 Orders',
                  style: GoogleFonts.fraunces(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey.shade400,
                child: Icon(FontAwesomeIcons.user),
              ),
            ),
          );
  }
}
