import 'package:ashique_admin_app/view/widget/productSwitch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../order/orderDetails.dart';

class SellerDetails extends StatelessWidget {
  const SellerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();
    var theme = Theme.of(context);
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                const SliverAppBar(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.white,
                  surfaceTintColor: Colors.white,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarBrightness: Brightness.dark,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  pinned: true,
                  floating: true,
                  automaticallyImplyLeading: false,
                  centerTitle: true,
                  title: Text(
                    'Mofizol Hasan',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  actions: [
                    // IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.search))
                  ],
                ),
                //Seller Account
                SliverList(
                    delegate: SliverChildListDelegate([
                  const SizedBox(height: 14),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      color: theme.primaryColor.withOpacity(.08),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 4, bottom: 4),
                              child: Text(
                                maxLines: 2,
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.ellipsis,
                                "Seller Account",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: theme.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Spacer(),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  )),
                              onPressed: () {},
                              child: const Text('Suspend'),
                            )
                          ],
                        ),
                        SizedBox(height: 5),
                        orderDetailsTile('Name', 'Orpon Hasan'),
                        orderDetailsTile('Mobile Number', '01932610623'),
                        orderDetailsTile('Email', 'developerorpon@gmail.com'),
                      ],
                    ),
                  ),
                ])),
                //Shop info
                SliverList(
                    delegate: SliverChildListDelegate([
                  const SizedBox(height: 14),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      color: theme.primaryColor.withOpacity(.08),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 4, bottom: 4),
                              child: Text(
                                maxLines: 2,
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.ellipsis,
                                "Shop Information",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: theme.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        orderDetailsTile('Shop Name', 'Rushda Soft'),
                        orderDetailsTile('Mobile Number', '01932610623'),
                        orderDetailsTile('Address ',
                            '2/Ka, 2nd Floor, Haji Dilgoni Market, Mohammadpur'),
                      ],
                    ),
                  ),
                ])),
                //Bank Info
                SliverList(
                    delegate: SliverChildListDelegate([
                  const SizedBox(height: 14),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      color: theme.primaryColor.withOpacity(.08),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 4, bottom: 4),
                              child: Text(
                                maxLines: 2,
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.ellipsis,
                                "Bank Information",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: theme.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        orderDetailsTile('Bank Name', 'No Data found'),
                        orderDetailsTile('Branch ', 'No Data found'),
                        orderDetailsTile('Holder Name ', 'No Data found'),
                        orderDetailsTile('Account No ', 'No Data found'),
                      ],
                    ),
                  ),
                ])),
                SliverList(
                    delegate: SliverChildListDelegate([
                  const SizedBox(height: 14),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      color: theme.primaryColor.withOpacity(.08),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 4, bottom: 4),
                              child: Text(
                                maxLines: 2,
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.ellipsis,
                                "Sales Commission",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: theme.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const Spacer(),
                            const CustomSwitch()
                          ],
                        ),
                        SizedBox(height: 5),
                        FormBuilder(
                          key: _formKey,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 13.0),
                            child: FormBuilderTextField(

                              name: 'Commission',
                              decoration: const InputDecoration(
                                helperText: 'If sales commission is disabled here, the system default commission will be applied.',
                                  helperStyle: TextStyle(
                                    color: Colors.red,
                                    fontSize: 7
                                  ),
                                  labelText: 'Commission ( % )',
                                  labelStyle: TextStyle(fontSize: 12)),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                              autofillHints: const [AutofillHints.name],
                              style: const TextStyle(fontSize: 14),
                            ),
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
                              'Save'.toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'robotoMono'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 200,
                  )
                ])),
              ])),
    );
  }
}
