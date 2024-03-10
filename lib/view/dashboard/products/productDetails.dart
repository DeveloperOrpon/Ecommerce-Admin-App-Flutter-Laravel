import 'package:ashique_admin_app/config/api/api_route.dart';
import 'package:ashique_admin_app/config/appConst.dart';
import 'package:ashique_admin_app/helper/helper.dart';
import 'package:ashique_admin_app/view/widget/networkImage.dart';
import 'package:ashique_admin_app/view/widget/productSwitch.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../model/Category.dart';
import '../../../model/productRes.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel product;

  const ProductDetails(this.product, {super.key});

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
        title: Text(
          '${product.name}',
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '${DateFormat('hh:mm a, dd MMM, yy').format(DateTime.parse(product.createdAt.toString()))}',
              style: TextStyle(fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 7),
            child: FormBuilderTextField(
              enabled: false,
              name: 'name',
              initialValue: '${product.name}',
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
                    initialValue: '${product.salePrice}',
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
                    initialValue: '${product.regularPrice}',
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
                    initialValue: '${product.price}',
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
                      child: NetworkImagePreview(
                        url: "$PRODUCT_THUMBMAIL_IMAGE_URL${product.thumbnail}",
                        width: 90,
                        height: 90,
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
                ...(product.images ?? []).map((e) => Stack(
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
                            child: NetworkImagePreview(
                              url: "$PRODUCT_IMAGE_URL${e}",
                              width: 90,
                              height: 90,
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
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: (product.categories!).length,
              itemBuilder: (context, index) =>
                  ChipsChoice<CategoryModel>.multiple(
                alignment: WrapAlignment.center,
                scrollPhysics: BouncingScrollPhysics(),
                choiceCheckmark: true,
                verticalDirection: VerticalDirection.down,
                value: (product.categories! ?? []),
                onChanged: (val) {},
                choiceStyle: C2ChipStyle.toned(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                wrapped: true,
                choiceItems: C2Choice.listFrom<CategoryModel, CategoryModel>(
                  avatarImage: (index, item) => AssetImage(appLogo),
                  source: (product.categories ?? []),
                  value: (i, v) => v,
                  label: (i, v) => v.name.toString(),
                ),
              ),
            ),
          ),
          const Divider(),
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
          Column(
            mainAxisSize: MainAxisSize.min,
            children: (product.attributes ?? [])
                .map(
                  (e) => Container(
                    margin: EdgeInsets.all(5),
                    height: 40,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${e.name} : ',
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
                          itemCount: (e.options??[]).length,
                          itemBuilder: (context, index) => Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: 5),
                            width: Get.width * .22,
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: .5,
                                )),
                            child: Text(
                              e.name=='Color'?"${product.colors![index].name}":'${e.options![index]}',
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
                )
                .toList(),
          ),
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
