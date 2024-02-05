import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

InputDecoration decoration(
    {required String title,required BuildContext context, IconData? iconData, Widget? postFixIcon,bool hideText=false,Color? fillColor,InputBorder? inputBorder}) =>
    InputDecoration(
      labelText: title,
      suffixIcon: postFixIcon,
      prefixIcon: iconData != null
          ? Icon(iconData, color: Theme.of(context).primaryColor)
          : const Center(),
      labelStyle: TextStyle(fontSize: 12,color: Theme.of(context).primaryColor),
      fillColor:fillColor?? Colors.grey.shade100,
      filled: true,
      border:inputBorder?? OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      enabledBorder: inputBorder?? OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      focusedBorder:inputBorder?? OutlineInputBorder(
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