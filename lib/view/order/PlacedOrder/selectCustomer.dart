import 'package:ashique_admin_app/config/appConst.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SelectCustomer extends StatelessWidget {
  const SelectCustomer({super.key});

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
                'Select A Customer',
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
                    autofocus: true,
                    name: 'search',
                    decoration: InputDecoration(
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
            SliverList(delegate: SliverChildListDelegate([
              SizedBox(height: 10),
            ])),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => _userTile(
                        name: 'Orpon Hasan',
                        subTitle: '1 order. BDT 160',
                        context: context),
                    childCount: 10))
          ],
        ),
      ),
    );
  }

  _userTile(
      {required String name,
      required String subTitle,
      required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 7),
      child: ListTile(
        onTap: () {
          Get.back();
        },
        tileColor: Theme.of(context).primaryColor.withOpacity(.1),
        shape: RoundedRectangleBorder(
          // side: BorderSide(color: Theme.of(context).primaryColor, width: .3),
          borderRadius: BorderRadius.circular(10),
        ),
        leading: CircleAvatar(
          backgroundImage: AssetImage(appLogo),
        ),
        title: Text(name, style: TextStyle(fontSize: 15)),
        subtitle: Text(subTitle, style: TextStyle(fontSize: 12)),
        trailing: Icon(Icons.phone_android),
      ),
    );
  }
}
