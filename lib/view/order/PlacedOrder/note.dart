import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../config/appConst.dart';

class Note extends StatelessWidget {
  const Note({super.key});

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
          'Order Note',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              CupertinoIcons.xmark,
              color: Colors.black,
            )),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Confirm',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 20),
        children: [
          TextFormField(
            maxLength: 300,
            maxLines: 10,
            cursorOpacityAnimates: GetPlatform.isIOS,
            buildCounter: (context, {required currentLength, required isFocused, maxLength}) => Text("$currentLength/$maxLength"),
            minLines: 8,
            style: TextStyle(fontSize: 14),
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade500,
                      width: .5,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                hintText: 'Please type here',
                hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 14,
                ),
                helperText: 'Your customer will see the note'),
          )
        ],
      ),
    );
  }
}
