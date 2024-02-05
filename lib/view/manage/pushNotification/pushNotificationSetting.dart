import 'package:ashique_admin_app/config/appConst.dart';
import 'package:ashique_admin_app/config/refresh.dart';
import 'package:ashique_admin_app/controller/paymentController.dart';
import 'package:ashique_admin_app/view/widget/productSwitch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../config/textStyle.dart';
import '../../../controller/notificationController.dart';

class PushNotificationSetting extends StatelessWidget {
  static const String routeName = 'PushNotificationSetting';

  const PushNotificationSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationController = Get.put(NotificationController());
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
          'PushNotification Setting',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.square_favorites_alt_fill),
            label: const Text('Save'),
          )
        ],
      ),
      body: SmartRefresher(
        physics: const BouncingScrollPhysics(),
        enablePullDown: true,
        enablePullUp: true,
        header: refreshLoading(context),
        footer: customFooter,
        controller: notificationController.refreshController,
        onRefresh: notificationController.onRefresh,
        onLoading: notificationController.onLoading,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate([
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6.0, vertical: 7),
                    child: FormBuilderTextField(
                      initialValue: 'Order pen message',
                      maxLines: 4,
                      minLines: 2,
                      name: 'url',
                      decoration: decoration(
                        postFixIcon: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 4),
                            CustomSwitch(),
                          ],
                        ),
                          inputBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: .4,
                            ),
                          ),
                          fillColor: Colors.white,
                          title: 'Order Pending Message',
                          context: context,
                          iconData: Icons.pending_actions_sharp,
                          hideText: true),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.maxWordsCount(8),
                      ]),
                      autofillHints: const [AutofillHints.email],
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6.0, vertical: 7),
                    child: FormBuilderTextField(
                      initialValue: 'Order con Message',
                      maxLines: 4,
                      minLines: 2,
                      name: 'url',
                      decoration: decoration(
                          postFixIcon: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: 4),
                              CustomSwitch(),
                            ],
                          ),
                          inputBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: .4,
                            ),
                          ),
                          fillColor: Colors.white,
                          title: 'Order Confirmation Message',
                          context: context,
                          iconData: Icons.offline_pin_rounded,
                          hideText: true),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.maxWordsCount(8),
                      ]),
                      autofillHints: const [AutofillHints.email],
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6.0, vertical: 7),
                    child: FormBuilderTextField(
                      initialValue: 'Order Processing Message',
                      maxLines: 4,
                      minLines: 2,
                      name: 'url',
                      decoration: decoration(
                          postFixIcon: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: 4),
                              CustomSwitch(),
                            ],
                          ),
                          inputBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: .4,
                            ),
                          ),
                          fillColor: Colors.white,
                          title: 'Order Processing Message',
                          context: context,
                          iconData: FontAwesomeIcons.barsProgress,

                          hideText: true),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.maxWordsCount(8),
                      ]),
                      autofillHints: const [AutofillHints.email],
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6.0, vertical: 7),
                    child: FormBuilderTextField(
                      initialValue: 'Order out for delivery Message',
                      maxLines: 4,
                      minLines: 2,
                      name: 'url',
                      decoration: decoration(
                          postFixIcon: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: 4),
                              CustomSwitch(),
                            ],
                          ),
                          inputBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: .4,
                            ),
                          ),
                          fillColor: Colors.white,
                          title: 'Order out for delivery Message',
                          context: context,
                          iconData: Icons.directions_bike_outlined,

                          hideText: true),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.maxWordsCount(8),
                      ]),
                      autofillHints: const [AutofillHints.email],
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6.0, vertical: 7),
                    child: FormBuilderTextField(
                      initialValue: 'Order Delivered Message',
                      maxLines: 4,
                      minLines: 2,
                      name: 'url',
                      decoration: decoration(
                          postFixIcon: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: 4),
                              CustomSwitch(),
                            ],
                          ),
                          inputBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: .4,
                            ),
                          ),
                          fillColor: Colors.white,
                          title: 'Order Delivered Message',
                          context: context,
                          iconData: Icons.delivery_dining,

                          hideText: true),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.maxWordsCount(8),
                      ]),
                      autofillHints: const [AutofillHints.email],
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6.0, vertical: 7),
                    child: FormBuilderTextField(
                      initialValue: 'Order Returned Message',
                      maxLines: 4,
                      minLines: 2,
                      name: 'url',
                      decoration: decoration(
                          postFixIcon: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: 4),
                              CustomSwitch(),
                            ],
                          ),
                          inputBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: .4,
                            ),
                          ),
                          fillColor: Colors.white,
                          title: 'Order Returned Message',
                          context: context,
                          iconData: CupertinoIcons.return_icon,

                          hideText: true),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.maxWordsCount(8),
                      ]),
                      autofillHints: const [AutofillHints.email],
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6.0, vertical: 7),
                    child: FormBuilderTextField(
                      initialValue: 'Order Failed Message',
                      maxLines: 4,
                      minLines: 2,
                      name: 'url',
                      decoration: decoration(
                          postFixIcon: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: 4),
                              CustomSwitch(),
                            ],
                          ),
                          inputBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: .4,
                            ),
                          ),
                          fillColor: Colors.white,
                          title: 'Order Failed Message',
                          context: context,
                          iconData: Icons.sms_failed,

                          hideText: true),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.maxWordsCount(8),
                      ]),
                      autofillHints: const [AutofillHints.email],
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 10),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
