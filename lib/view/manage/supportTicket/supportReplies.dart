import 'dart:developer';

import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../config/refresh.dart';
import '../../../controller/supportController.dart';

class SupportReplies extends StatefulWidget {
  const SupportReplies({super.key});

  @override
  State<SupportReplies> createState() => _SupportRepliesState();
}

class _SupportRepliesState extends State<SupportReplies> {
  final supportController = Get.put(SupportController());

  @override
  void initState() {
    super.initState();
  }

  TextEditingController messageController = TextEditingController();
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
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
          'Ticket Replies #12333',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Close",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: SmartRefresher(
            physics: const BouncingScrollPhysics(),
            enablePullDown: true,
            enablePullUp: true,
            header: refreshLoading(context),
            footer: customFooter,
            controller: supportController.refreshControllerReplies,
            onRefresh: supportController.onRefreshReplies,
            onLoading: supportController.onLoadingReplies,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 8.0, left: 12),
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.info),
                      Padding(
                        padding: EdgeInsets.only(left: 3.0),
                        child: Text(
                          "Issue About App Order Place",
                          style: TextStyle(color: Colors.black87, fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
                ...List.generate(3, (index) => index).map((message) =>
                    _messageTile("Message $message", message % 2 == 0))
              ],
            ),
          )),
          FormBuilder(
            key: _formKey,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  )),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical:10),
                    child: FormBuilderTextField(
                      focusNode: focusNode,
                      onChanged: (value) {},
                      controller: messageController,
                      minLines: 2,
                      maxLines: 6,
                      // initialValue: 'city',
                      name: 'description',
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 12),
                          hintText: 'Write here',
                          hintStyle: const TextStyle(color: Colors.grey),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: .3)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: .3)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: .3))),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 2),
                    child: Row(
                      children: [
                        Expanded(
                          child: CupertinoButton(
                            disabledColor: Colors.grey,
                            onPressed: () {},
                            color: Theme.of(context).primaryColor,
                            child: const Text(
                              "Send",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _messageTile(String message, bool isUser) {
    RegExp regExp = RegExp(r'https?://(?:[-\w.]|(?:%[\da-fA-F]{2}))+');
    RegExp regExp2 = RegExp(r'www?.(?:[-\w.]|(?:%[\da-fA-F]{2}))+');
    log("regExp1 ${regExp.stringMatch(message).toString()}");
    log("regExp2 ${regExp2.stringMatch(message).toString()}");
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment:  isUser ?CrossAxisAlignment.end:CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(

            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(10)),
              color: !isUser ? Colors.grey.shade500 : Colors.white,
            ),
            child: Text(
              message,
              style: TextStyle(
                  color:
                      isUser ? Colors.black.withOpacity(.9) : Colors.black87),
            ),
          ),
          if (message.toLowerCase().contains('http') ||
              message.toString().contains('www.'))
            AnyLinkPreview(
              link: (regExp.stringMatch(message) ??
                      ("https://${regExp2.stringMatch(message)}"))
                  .toString(),
              displayDirection: UIDirection.uiDirectionVertical,
              showMultimedia: true,
              bodyMaxLines: 3,
              bodyTextOverflow: TextOverflow.ellipsis,
              titleStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              bodyStyle: TextStyle(color: Colors.grey, fontSize: 12),
              errorWidget: Container(
                color: Colors.grey[300],
                child: const Text('Oops!'),
              ),
              cache: Duration(days: 7),
              backgroundColor: Colors.grey[300],
              borderRadius: 0,
              removeElevation: false,
              boxShadow: const [BoxShadow(blurRadius: 3, color: Colors.grey)],
              onTap: () {}, // This disables tap event
            ),
        ],
      ),
    );
  }
}
