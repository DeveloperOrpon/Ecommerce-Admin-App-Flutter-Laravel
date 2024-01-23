import 'package:ashique_admin_app/config/appConst.dart';
import 'package:ashique_admin_app/config/textStyle.dart';
import 'package:ashique_admin_app/view/screen/homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _emailFieldKey = GlobalKey<FormBuilderFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: FormBuilder(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 60),
            Image.asset(
              appLogo,
              height: 200,
            ),
            SizedBox(height: 10),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 13.0, vertical: 7),
              child: FormBuilderTextField(
                key: _emailFieldKey,
                name: 'email',
                decoration: decoration(
                    title: 'Email Address',
                    context: context,
                    iconData: CupertinoIcons.mail_solid),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ]),
                autofillHints: const [AutofillHints.email],
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 13.0, vertical: 7),
              child: FormBuilderTextField(
                obscureText: true,
                name: 'password',
                decoration: decoration(
                  title: 'Password',
                  context: context,
                  iconData: CupertinoIcons.lock_circle,
                  hideText: true
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.maxWordsCount(8),
                ]),
                autofillHints: const [AutofillHints.email],
                style: const TextStyle(fontSize: 14),
              ),
            ),
            FormBuilderFieldDecoration<bool>(
              name: 'terms',

              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.equal(true),
              ]),
              // initialValue: true,
              decoration: const InputDecoration(labelText: 'Accept Terms?'),
              builder: (FormFieldState<bool?> field) {
                return InputDecorator(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorText: field.errorText,
                  ),
                  child: SwitchListTile(
                    activeTrackColor: Theme.of(context).primaryColor,
                    activeColor: Colors.white,
                    title: const Text(
                      'I have read and accept the terms of service.',
                      style: TextStyle(fontSize: 12),
                    ),
                    onChanged: field.didChange,
                    value: field.value ?? false,
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            CupertinoButton(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
              onPressed: () {
                if (_formKey.currentState?.saveAndValidate() ?? false) {
                  if (true) {
                    Get.to(HomeScreen(),transition: Transition.fadeIn);
                  }
                }
                debugPrint(_formKey.currentState?.value.toString());
              },
              child: Text(
                'Login'.toUpperCase(),
                style: TextStyle(color: Colors.white,fontFamily: 'robotoMono'),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
