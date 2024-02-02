import 'package:ashique_admin_app/config/appConst.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SelectProductVariant extends StatelessWidget {
  const SelectProductVariant({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: CustomScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              actions: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Select',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
              elevation: 0,
              pinned: true,
              backgroundColor: Colors.white,
              foregroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarBrightness: Brightness.dark,
                statusBarIconBrightness: Brightness.dark,
              ),
              title: const Text(
                'Select Variants',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.normal),
              ),
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    CupertinoIcons.xmark,
                    color: Colors.black,
                  )),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              const ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(appLogo),
                ),
                title: Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  "Lorem ipsum is placeholder text used in the graphic, print, and publishing ",
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              Divider(color: Colors.grey.shade200)
            ])),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => _variantTile(context),
                    childCount: 10))
          ],
        ),
      ),
    );
  }

  _variantTile(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RadioListTile(

          contentPadding: EdgeInsets.zero,
          value: "value",
          groupValue: "groupValue",
          onChanged: (value) {
            Get.back();
            Get.back();
          },
          secondary: Icon(
            Icons.propane_tank_rounded,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(
            'Red-XL-40CM',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'BDT 150.00',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Text(
                '100 available',
                style: TextStyle(
                  fontSize: 8,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 2,
          color: Theme.of(context).primaryColor.withOpacity(.1),
        )
      ],
    );
  }
}
