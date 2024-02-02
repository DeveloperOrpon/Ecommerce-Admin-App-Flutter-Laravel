import 'package:ashique_admin_app/controller/homeController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ManageContent extends StatelessWidget {
  const ManageContent({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
            ),
            pinned: true,
            floating: true,
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: const Text(
              'Manage',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
            actions: [
              // IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.search))
            ],
          ),
          SliverGrid(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => InkWell(
                    onTap: () {
                      homeController.manageGridRoute[index];
                    },
                    child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: 4, right: 4, left: 4, bottom: 7),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
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
                                    size: 50,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    homeController.manageGrid[index].keys.first,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                  ),
                  childCount: homeController.manageGrid.length),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 4,
                crossAxisSpacing: 5,
              ))
        ],
      ),
    );
  }
}
