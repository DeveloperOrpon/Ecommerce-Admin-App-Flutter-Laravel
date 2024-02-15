import 'package:ashique_admin_app/controller/homeController.dart';
import 'package:ashique_admin_app/view/widget/productSwitch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:top_modal_sheet/top_modal_sheet.dart';

class SocialMedia extends StatelessWidget {
  static const String routeName = 'SocialMedia';

  const SocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
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
                'Social Media',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    showAddFAQForm(context);
                  },
                  icon: const Icon(CupertinoIcons.add),
                )
              ],
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              _socialTitle(),
              _socialTitle(),
              _socialTitle(),
              _socialTitle(),
            ]))
          ],
        ),
      ),
    );
  }

  Padding _socialTitle() {
    return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                tileColor: Colors.grey.shade100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/logo/twitter.png'),
                ),
                title: Text('twitter'),
                subtitle: Text('www.twitter.com/rushdadoft'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                    SizedBox(width: 5),
                    CustomSwitch(),
                  ],
                ),
              ),
            );
  }

  showAddFAQForm(BuildContext context) {
    final homeController = Get.put(HomeController());
    final _formKey = GlobalKey<FormBuilderState>();
    return showTopModalSheet(
      // barrierDismissible: false,
      backgroundColor: Colors.white,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      context,
      Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        height: Get.height * .33,
        child: FormBuilder(
          key: _formKey,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              FormBuilderDropdown(
                name: 'Social',
                decoration: InputDecoration(
                  labelText: 'Social Medial',
                  labelStyle: TextStyle(fontSize: 14),
                  suffix: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      _formKey.currentState!.fields['gender']?.reset();
                    },
                  ),
                  hintText: 'Select Social Medial',
                ),
                items: homeController.socialGrid
                    .map((gender) => DropdownMenuItem(
                          alignment: AlignmentDirectional.center,
                          value: gender['title'],
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundImage: AssetImage(gender['logo']),
                                ),
                                SizedBox(width: 10),
                                Text(gender['title']),
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13.0),
                child: FormBuilderTextField(
                  name: 'Link',
                  decoration: const InputDecoration(
                      labelText: 'Link', labelStyle: TextStyle(fontSize: 12)),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                  autofillHints: const [AutofillHints.name],
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoButton(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.saveAndValidate()) {
                      if (true) {}
                    }
                    debugPrint(_formKey.currentState?.value.toString());
                  },
                  child: Text(
                    'Save'.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'robotoMono'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
