import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../config/textStyle.dart';
import '../../widget/productSwitch.dart';

class MailConfig extends StatelessWidget {
  static const String routeName = 'MailConfig';
  const MailConfig({super.key});

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
                'MailConfig',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              actions: [

              ],
            ),
            SliverList(delegate: SliverChildListDelegate([
              Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(
                      color: Theme
                          .of(context)
                          .primaryColor,
                      width: .4,
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const  Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Icon(Icons.mail),
                                    Text("Smtp Mail Config"),
                                  ],
                                ),
                              ),
                              CustomSwitch(value: false),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6.0, vertical: 7),
                            child: FormBuilderTextField(
                              obscureText: true,
                              name: 'Mailer Name',
                              decoration: decoration(
                                  title: 'Mailer Name',
                                  context: context,
                                  iconData: Icons.drive_file_rename_outline,
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
                              obscureText: true,
                              name: 'Host',
                              decoration: decoration(
                                  title: 'Host',
                                  context: context,
                                  iconData: Icons.holiday_village,
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
                              obscureText: true,
                              name: 'Driver',
                              decoration: decoration(
                                  title: 'Driver',
                                  context: context,
                                  iconData: Icons.drafts,
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
                              obscureText: true,
                              name: 'port',
                              decoration: decoration(
                                  title: 'Port',
                                  context: context,
                                  iconData: Icons.numbers,
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
                              obscureText: true,
                              name: 'Username',
                              decoration: decoration(
                                  title: 'Username',
                                  context: context,
                                  iconData: Icons.verified_user,
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
                              obscureText: true,
                              name: 'Email ID',
                              decoration: decoration(
                                  title: 'Email ID',
                                  context: context,
                                  iconData: Icons.numbers,
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
                              obscureText: true,
                              name: 'Encryption',
                              decoration: decoration(
                                  title: 'Encryption',
                                  context: context,
                                  iconData: Icons.enhanced_encryption,
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
                              obscureText: true,
                              name: 'Password',
                              decoration: decoration(
                                  title: 'Password',
                                  context: context,
                                  iconData: Icons.lock,
                                  hideText: true),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.maxWordsCount(8),
                              ]),
                              autofillHints: const [AutofillHints.email],
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]))
          ],
        ),
      ),
    );
  }
}
