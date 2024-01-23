import 'dart:developer';

import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';


class ProductVariantItem extends StatelessWidget {
  final String sku;
  const ProductVariantItem({super.key, required this.sku});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          FormBuilderTextField(
            name: 'sku',
            enabled: false,
            initialValue: sku,
            decoration: const InputDecoration(
                labelText: 'Variant SKU',
                labelStyle: TextStyle(fontSize: 12)),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
            ]),
            autofillHints: const [AutofillHints.name],
            style: const TextStyle(fontSize: 14),
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 13.0, vertical: 3),
                  child: FormBuilderTextField(
                    name: 'price',
                    initialValue: '0.00',
                    decoration: InputDecoration(
                        labelText: 'Pice',
                        prefixIcon: Icon(CupertinoIcons.money_dollar),
                        labelStyle: TextStyle(fontSize: 12)),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    autofillHints: const [AutofillHints.name],
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 13.0, vertical: 3),
                  child: FormBuilderTextField(
                    name: 'salePrice',
                    initialValue: '0.00',
                    decoration: const InputDecoration(
                        labelText: 'Sale Price',
                        prefixIcon: Icon(CupertinoIcons.money_dollar),
                        labelStyle: TextStyle(fontSize: 12)),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    autofillHints: const [AutofillHints.name],
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
