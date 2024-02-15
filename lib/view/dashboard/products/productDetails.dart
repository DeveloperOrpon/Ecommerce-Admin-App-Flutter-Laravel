import 'package:ashique_admin_app/config/appConst.dart';
import 'package:ashique_admin_app/helper/helper.dart';
import 'package:ashique_admin_app/view/widget/productSwitch.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
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
        automaticallyImplyLeading: false,
        // centerTitle: true,
        title: const Text(
          'Long T-shirt For Man',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit,
                  color: Colors.green,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
                onPressed: () {
                  deleteDialog(context, onTap: () {});
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: CustomSwitch(),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        physics: BouncingScrollPhysics(),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Product Created at',
              style: TextStyle(fontSize: 15),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '	03:34 am, 10 Jun, 23',
              style: TextStyle(fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 7),
            child: FormBuilderTextField(
              enabled: false,
              name: 'name',
              initialValue: 'Long T-shirt For Man',
              decoration: const InputDecoration(
                  labelText: 'Name', labelStyle: TextStyle(fontSize: 12)),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ]),
              autofillHints: const [AutofillHints.name],
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 7),
            child: Row(
              children: [
                Expanded(
                  child: FormBuilderTextField(
                    enabled: false,
                    name: 'Selling',
                    initialValue: '120.00',
                    decoration: const InputDecoration(
                        labelText: 'Selling',
                        prefixIcon: Icon(CupertinoIcons.money_dollar),
                        labelStyle: TextStyle(fontSize: 12)),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    autofillHints: const [AutofillHints.name],
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                Expanded(
                  child: FormBuilderTextField(
                    enabled: false,
                    name: 'Purchased',
                    initialValue: '120.00',
                    decoration: const InputDecoration(
                        labelText: 'Purchased',
                        prefixIcon: Icon(CupertinoIcons.money_dollar),
                        labelStyle: TextStyle(fontSize: 12)),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    autofillHints: const [AutofillHints.name],
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                Expanded(
                  child: FormBuilderTextField(
                    enabled: false,
                    name: 'Offered',
                    initialValue: '120.00',
                    decoration: const InputDecoration(
                        labelText: 'Offered',
                        prefixIcon: Icon(CupertinoIcons.money_dollar),
                        labelStyle: TextStyle(fontSize: 12)),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    autofillHints: const [AutofillHints.name],
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 90,
                    margin: EdgeInsets.all(6),
                    width: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: Colors.grey.shade500, width: .5)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        appLogo,
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Product Thumbnail Image',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 90,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...List.generate(4, (index) => 1).map((e) => Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 90,
                          margin: EdgeInsets.all(6),
                          width: 90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.grey.shade500, width: .5)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              appLogo,
                              width: 90,
                              height: 90,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: RichText(
              text: const TextSpan(children: [
                TextSpan(
                  text: 'Product all others Images\n',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                TextSpan(
                  text: '(Those image are show in product images)',
                  style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic,
                      color: Colors.black87),
                ),
              ]),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Product Categories',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: ListView.builder(itemBuilder: (context, index) => ChipsChoice<String>.multiple(
              alignment: WrapAlignment.center,
              scrollPhysics: BouncingScrollPhysics(),
              choiceCheckmark: true,
              verticalDirection: VerticalDirection.down,
              value: const ['Phone','TV','Electronic'],
              onChanged: (val) {},
              choiceStyle: C2ChipStyle.toned(
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              wrapped: true,
              choiceItems: C2Choice.listFrom<String, String>(
                avatarImage: (index, item) => AssetImage(appLogo),
                source: ['Phone','TV','Electronic'],
                value: (i, v) => v,
                label: (i, v) => v,
              ),
            ),),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Product Inventory',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 40,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Colors : ',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) => Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 5),
                    width: Get.width * .2,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: .5,
                        )),
                    child: Text(
                      'Red',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ))
              ],
            ),
          ),
          SizedBox(height: 5),
          SizedBox(
            height: 40,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Size : ',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) => Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 5),
                    width: Get.width * .2,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: .5,
                        )),
                    child: Text(
                      'L',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ))
              ],
            ),
          ),
          SizedBox(height: 5),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Product Other Options',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GridView(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 20),
            children: [
              ElevatedButton(onPressed: () {}, child: const Text("Orders")),
              ElevatedButton(onPressed: () {}, child: const Text("Statistics")),
              ElevatedButton(onPressed: () {}, child: const Text("Overview")),
            ],
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
