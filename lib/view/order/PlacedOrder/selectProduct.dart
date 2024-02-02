import 'package:ashique_admin_app/config/appConst.dart';
import 'package:ashique_admin_app/view/order/PlacedOrder/selectProductVariant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SelectProduct extends StatelessWidget {
  const SelectProduct({super.key});

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
                'Select A Product',
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
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(50),
                  child: FormBuilderTextField(
                    // autofocus: true,
                    name: 'search',
                    decoration: InputDecoration(
                      suffixIcon: Icon(CupertinoIcons.qrcode_viewfinder),
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Search',
                      prefixIcon: Icon(CupertinoIcons.search),
                      labelStyle: TextStyle(
                          fontSize: 12, color: Theme.of(context).primaryColor),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    autofillHints: const [AutofillHints.name],
                    style: const TextStyle(fontSize: 14),
                  )),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              SizedBox(height: 10),
              const Text(
                "Total 10 . Recently Updated",
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 10),
            ])),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => _productTile(context),
                    childCount: 10))
          ],
        ),
      ),
    );
  }

  _productTile(BuildContext context) {
    return InkWell(
      onTap: () {
        // Get.back();
        Get.to(SelectProductVariant(),transition: Transition.rightToLeftWithFade);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6),
        height: 90,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(.05),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              child: Image.asset(
                appLogo,
                width: 90,
                fit: BoxFit.cover,
                height: 100,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  "Lorem ipsum is placeholder text used in the graphic, print, and publishing ",
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "BDT 150.00",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Text(
                  "166 available ",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
