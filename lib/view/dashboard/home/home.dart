import 'package:ashique_admin_app/config/appConst.dart';
import 'package:ashique_admin_app/controller/homeController.dart';
import 'package:ashique_admin_app/view/dashboard/home/categories.dart';
import 'package:ashique_admin_app/view/dashboard/home/homeBestSellingSilder.dart';
import 'package:ashique_admin_app/view/dashboard/home/monthEarnLine.dart';
import 'package:ashique_admin_app/view/dashboard/home/salesRate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../manage/manage.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            leadingWidth: Get.width*.3,
            leading: Row(
              children: [
                IconButton(
                  style: IconButton.styleFrom(
                    padding: EdgeInsetsDirectional.zero
                  ),
                    onPressed: () {},
                    icon: Icon(
                      Icons.mail,
                      color: Theme.of(context).primaryColor,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Theme.of(context).primaryColor,
                    )),
              ],
            ),
            foregroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
            ),
            backgroundColor: Colors.white,
            pinned: true,
            floating: true,
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Image.asset(
              appLogo,
              fit: BoxFit.fitHeight,
              height: 100,
            ),
            actions: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(.7),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(appVersion),
              )
            ],
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Overview',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                PopupMenuButton<String>(
                  initialValue: homeController.homeGridFilter[0],
                  child: Row(
                    children: [
                      Text(
                        'Overview',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(width: 5),
                      Icon(FontAwesomeIcons.circleArrowDown)
                    ],
                  ),
                  onSelected: (String item) {},
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    ...homeController.homeGridFilter
                        .map((e) => PopupMenuItem<String>(
                              value: e,
                              child: Text(e.toString()),
                            ))
                  ],
                ),
              ],
            ),
          ])),
          SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: homeController.homeGrid.length,
                (context, index) => Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 6),
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.withOpacity(.01),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: .5,
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${homeController.homeGrid[index]}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(height: 10),
                          Center(
                            child: Text(
                              '$index',
                              style: GoogleFonts.robotoMono(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              )),
          SliverList(
              delegate: SliverChildListDelegate([
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Home Shortcuts',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _homeShortcutAddDialog(context, homeController);
                  },
                  icon: Icon(
                    CupertinoIcons.add,
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => SizedBox(
                  height: 55,
                  width: 90,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            top: 4, right: 4, left: 4, bottom: 7),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            border:
                                Border.all(color: Colors.black26, width: .3)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              homeController.manageGrid[index].values.first,
                              size: 30,
                              color: Theme.of(context).primaryColor,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                itemCount: 6,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Your Categories',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.add,
                  ),
                )
              ],
            ),
            CategoriesHome(),

            SizedBox(height: 10),
            // HomeSlider
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.0, bottom: 8),
                  child: Text(
                    'Sales Rate',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SalesRate(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.0, bottom: 8),
                  child: Text(
                    'Best Selling',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            const HomeSlider(),
            //end
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Monthly Earning',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 400,
              child: MonthlyEarnLineChart(),
            )
          ]))
        ],
      ),
    );
  }

  _homeShortcutAddDialog(BuildContext context, HomeController homeController) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(10),
        height: Get.height * .6,
        child: ListView.builder(
            itemBuilder: (context, index) =>
                manageTitle(homeController, context, index, isCheck: index < 4),
            itemCount: homeController.manageGrid.length),
      ),
    );
  }
}
