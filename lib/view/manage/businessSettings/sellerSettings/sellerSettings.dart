import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SellerSettings extends StatelessWidget {
  const SellerSettings({super.key});
  static const String routeName = 'SellerSettings';

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seller Settings'),
        elevation: 0,
      ),
      body: FormBuilder(
        key: _formKey,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            FormBuilderFieldDecoration<bool>(
              name: 'stock',

              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.equal(true),
              ]),
              // initialValue: true,
              decoration: const InputDecoration(labelText: 'stock'),
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
                      'Seller Registration on/off',
                      style:
                      TextStyle(fontSize: 15),
                    ),
                    onChanged: field.didChange,
                    value:true,
                  ),
                );
              },
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 13.0, vertical: 7),
              child: FormBuilderTextField(
                initialValue: "0",
                name: 'Commission',
                decoration: const InputDecoration(
                    labelText: 'Default Sales Commission ( % )', labelStyle: TextStyle(fontSize: 12)),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                autofillHints: const [AutofillHints.name],
                style: const TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 10),
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
                    if (true) {

                    }
                  }
                  debugPrint(_formKey.currentState?.value.toString());
                },
                child: Text(
                  'Save'.toUpperCase(),
                  style:
                  TextStyle(color: Colors.white, fontFamily: 'robotoMono'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
