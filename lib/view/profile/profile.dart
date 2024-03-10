import 'package:ashique_admin_app/config/appConst.dart';
import 'package:ashique_admin_app/controller/AuthenticationController.dart';
import 'package:ashique_admin_app/view/profile/changeUserInformation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:live_background/object/palette.dart';
import 'package:live_background/widget/live_background_widget.dart';

import '../../config/api/api_route.dart';
import '../widget/networkImage.dart';
import 'changePassword.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    final authenticationController = Get.put(AuthenticationController());
    return Obx(() {
      return CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: Colors.transparent,
            pinned: true,
            floating: true,
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text('Profile'),
            actions: [
              // IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.search))
            ],
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      child: Padding(
                        padding: EdgeInsets.all(1),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: NetworkImagePreview(
                            url: ADMIN_IMAGE_URL+authenticationController
                                .adminRes.value!.user!.image
                                .toString(),
                            width: 120,
                            height: 120,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: -5,
                      top: -5,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_a_photo,
                            color: Theme.of(context).primaryColor,
                          )),
                    )
                  ],
                ),
              ],
            ),
            //options
            const SizedBox(height: 6),
            Center(
              child: Text(
                '${authenticationController.adminRes.value!.user!.email}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _profileOptionTile(
              context,
              title: 'User information',
              onTap: () {
                Get.to(const ChangeUserInformation(),
                    transition: Transition.rightToLeftWithFade);
              },
              iconData: FontAwesomeIcons.user,
              subTitle:
                  "Tap For edit and show about current user information's",
            ),
            _profileOptionTile(
              context,
              title: 'Change Password',
              onTap: () {
                Get.to(const ChangePassword(),
                    transition: Transition.rightToLeftWithFade);
              },
              iconData: FontAwesomeIcons.key,
              subTitle: "Tap For change current user Password",
            ),
            _profileOptionTile(
              context,
              title: 'Logout',
              onTap: () {
                authenticationController.logout();
              },
              iconData: Icons.login_outlined,
              subTitle: "Tap For logout current user",
            ),
          ]))
        ],
      );
    });
  }

  Padding _profileOptionTile(BuildContext context,
      {required Function onTap,
      required String title,
      required String subTitle,
      required IconData iconData}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
      child: ListTile(
        onTap: () {
          onTap();
        },
        tileColor: Colors.grey.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        leading: Icon(
          iconData,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        trailing: Icon(CupertinoIcons.arrowshape_turn_up_right_fill,
            color: Theme.of(context).primaryColor),
        subtitle: Text(
          subTitle,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.normal,
            color: Theme.of(context).primaryColor.withOpacity(.7),
          ),
        ),
      ),
    );
  }
}
