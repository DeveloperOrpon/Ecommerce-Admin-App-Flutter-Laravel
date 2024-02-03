import 'package:ashique_admin_app/view/manage/banner/chooseBanner.dart';
import 'package:ashique_admin_app/view/manage/payment/paymentMethod.dart';
import 'package:ashique_admin_app/view/manage/shipping/shippingMethod.dart';
import 'package:ashique_admin_app/view/screen/redirectScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'config/theme/darkTheme.dart';
import 'config/theme/lightTheme.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      routes: {
        ChooseBanner.routeName: (context) => const ChooseBanner(),
        ShippingMethod.routeName: (context) => const ShippingMethod(),
        PaymentMethod.routeName: (context) => const PaymentMethod(),
      },
      home: const RedirectScreen(),
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      title: 'Flutter Demo',
      locale: Get.deviceLocale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
