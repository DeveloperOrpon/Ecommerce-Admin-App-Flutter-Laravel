import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../config/appConst.dart';
import '../../../../config/textStyle.dart';

class AddProductFlashDeal extends StatelessWidget {
  const AddProductFlashDeal({super.key});

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
        title: const Text(
          'Add Product In FlashDeal',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildListDelegate([
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6.0, vertical: 7),
                    child: FormBuilderDropdown<String>(
                      // initialValue: ,
                      name: 'Add new product',
                      validator: FormBuilderValidators.required(),
                      decoration:
                      const InputDecoration(label: Text("Add new product")),
                      onChanged: (value) {
                        // setState(() {
                        //   option = value;
                        // });
                      },
                      items: List.generate(10, (index) => "$index").toList()
                          .map(
                              (e) => DropdownMenuItem(value: e, child: selectedProductTile(context,isShowDeleteButton: false)))
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ])),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) => selectedProductTile(context),
            childCount: 5,
          ))
        ],
      ),
    );
  }
}
selectedProductTile(BuildContext context,{bool isShowDeleteButton=true}) {
  return Container(
    height: 70,
    padding: EdgeInsets.all(6),
    margin: EdgeInsets.all(6),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: Colors.grey.shade200,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Row(
      children: [
        Image.asset(
          appLogo,
          width: 100,
          height: 70,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 10),
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  maxLines: 1,
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  "Iphone 15 Pro Max Black 256GB",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  maxLines: 1,
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  "BDT 10,000",
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )),
        if(isShowDeleteButton)  Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.red.withOpacity(.5),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        )
      ],
    ),
  );
}
