import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AddCurrency extends StatelessWidget {
  const AddCurrency({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();
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
          'Add Currency',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: FormBuilder(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(10),
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 13.0, vertical: 7),
              child: FormBuilderTextField(
                name: 'currencyName',
                decoration: const InputDecoration(
                    labelText: 'Currency Name',
                    labelStyle: TextStyle(fontSize: 12)),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                autofillHints: const [AutofillHints.name],
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 13.0, vertical: 7),
              child: FormBuilderTextField(
                name: 'currencySymbol',
                decoration: const InputDecoration(
                    labelText: 'Currency Symbol',
                    labelStyle: TextStyle(fontSize: 12)),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                autofillHints: const [AutofillHints.name],
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 13.0, vertical: 7),
              child: FormBuilderTextField(
                name: 'currencyCode',
                decoration: const InputDecoration(
                    labelText: 'Currency Code',
                    labelStyle: TextStyle(fontSize: 12)),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                autofillHints: const [AutofillHints.name],
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 13.0, vertical: 7),
              child: FormBuilderTextField(
                name: 'currencyExchangeRate',
                decoration: const InputDecoration(
                    labelText: 'Currency Exchange Rate',
                    labelStyle: TextStyle(fontSize: 12)),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                autofillHints: const [AutofillHints.name],
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoButton(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                onPressed: () {
                  if (_formKey.currentState!.saveAndValidate()) {
                    if (true) {}
                  }
                  debugPrint(_formKey.currentState?.value.toString());
                },
                child: Text(
                  'Add Currency'.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'robotoMono'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
