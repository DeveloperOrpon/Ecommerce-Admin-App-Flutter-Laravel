import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:top_modal_sheet/top_modal_sheet.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  static const String routeName = 'FAQScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQ'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              showAddFAQForm(context);
            },
            icon: Icon(CupertinoIcons.add),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            _faqTitle(context),
            _faqTitle(context),
            _faqTitle(context),
            _faqTitle(context),
            _faqTitle(context),
          ]))
        ],
      ),
    );
  }

  Padding _faqTitle(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 4),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              leading: Text('SL#1',style: TextStyle(
               color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),),
              title: Text('Question Title',style: TextStyle(
                fontSize: 16,
              ),),
              subtitle: Text('Quention Answer Overall Information',style: TextStyle(
                fontSize: 10,
              ),),
              tileColor: Colors.grey.shade100,
              trailing: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  )
                ),
                onPressed: () {},
                // icon: Icon(Icons.arrow_drop_down),
                child: Text('Action'),
              ),
            ),
          );
  }

  showAddFAQForm(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();
    return showTopModalSheet(
      barrierDismissible: false,
      backgroundColor: Colors.white,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      context,
      Container(
        height: Get.height * .5,
        child: FormBuilder(
          key: _formKey,
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              FormBuilderFieldDecoration<bool>(
                name: 'Status',

                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.equal(true),
                ]),
                // initialValue: true,
                decoration: const InputDecoration(labelText: 'Status'),
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
                        'Status',
                        style: TextStyle(fontSize: 15),
                      ),
                      onChanged: field.didChange,
                      value: true,
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13.0),
                child: FormBuilderTextField(
                  name: 'Question',
                  decoration: const InputDecoration(
                      labelText: 'Question',
                      labelStyle: TextStyle(fontSize: 12)),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                  autofillHints: const [AutofillHints.name],
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13.0),
                child: FormBuilderTextField(
                  minLines: 3,
                  maxLines: 3,
                  name: 'Answer',
                  decoration: const InputDecoration(
                      labelText: 'Answer', labelStyle: TextStyle(fontSize: 12)),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                  autofillHints: const [AutofillHints.name],
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13.0),
                child: FormBuilderTextField(
                  keyboardType: TextInputType.number,
                  name: 'Ranking',
                  decoration: const InputDecoration(
                      labelText: 'Ranking',
                      labelStyle: TextStyle(fontSize: 12)),
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
                      if (true) {}
                    }
                    debugPrint(_formKey.currentState?.value.toString());
                  },
                  child: Text(
                    'Save'.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'robotoMono'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
