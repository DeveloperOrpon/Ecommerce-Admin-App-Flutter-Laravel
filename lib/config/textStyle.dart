import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

InputDecoration decoration(
    {required String title,required BuildContext context, IconData? iconData,bool hideText=false}) =>
    InputDecoration(
      labelText: title,


      prefixIcon: iconData != null
          ? Icon(iconData, color: Theme.of(context).primaryColor)
          : const Center(),
      labelStyle: TextStyle(fontSize: 12,color: Theme.of(context).primaryColor),
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
    );
TextStyle productTextStyle=const TextStyle(
  fontSize: 12,
  fontFamily: 'roboto',
  color: Colors.black54,
  fontWeight: FontWeight.normal
);