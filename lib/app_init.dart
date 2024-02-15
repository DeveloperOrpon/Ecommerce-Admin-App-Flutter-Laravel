import 'package:ashique_admin_app/view/manage/MailConfig/MailConfig.dart';
import 'package:ashique_admin_app/view/manage/Sellers/Sellers.dart';
import 'package:ashique_admin_app/view/manage/SocialMedia/SocialMedia.dart';
import 'package:ashique_admin_app/view/manage/WebConfig/WebConfig.dart';
import 'package:ashique_admin_app/view/manage/banner/chooseBanner.dart';
import 'package:ashique_admin_app/view/manage/brand/brandScreen.dart';
import 'package:ashique_admin_app/view/manage/businessSettings/about/aboutUsScreen.dart';
import 'package:ashique_admin_app/view/manage/businessSettings/businessSettings.dart';
import 'package:ashique_admin_app/view/manage/businessSettings/currency/home.dart';
import 'package:ashique_admin_app/view/manage/businessSettings/faq/faq.dart';
import 'package:ashique_admin_app/view/manage/businessSettings/privacy/privacy.dart';
import 'package:ashique_admin_app/view/manage/businessSettings/sellerSettings/sellerSettings.dart';
import 'package:ashique_admin_app/view/manage/businessSettings/terms/terms.dart';
import 'package:ashique_admin_app/view/manage/coupon/coupon.dart';
import 'package:ashique_admin_app/view/manage/customer/customer.dart';
import 'package:ashique_admin_app/view/manage/deals/allDeals.dart';
import 'package:ashique_admin_app/view/manage/payment/paymentMethod.dart';
import 'package:ashique_admin_app/view/manage/productReviews/ProductReviews.dart';
import 'package:ashique_admin_app/view/manage/pushNotification/pushNotificationSetting.dart';
import 'package:ashique_admin_app/view/manage/shipping/shippingMethod.dart';
import 'package:ashique_admin_app/view/manage/supportTicket/supportTicket.dart';
import 'package:ashique_admin_app/view/dashboard/redirectScreen.dart';
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
        CouponScreen.routeName: (context) => const CouponScreen(),
        PushNotificationSetting.routeName: (context) => const PushNotificationSetting(),
        CustomerScreen.routeName: (context) => const CustomerScreen(),
        BrandScreen.routeName: (context) => const BrandScreen(),
        AllDeals.routeName: (context) => const AllDeals(),
        SupportTicket.routeName: (context) => const SupportTicket(),
        BusinessSettings.routeName: (context) => const BusinessSettings(),
        CurrencyHome.routeName: (context) => const CurrencyHome(),
        AboutUs.routeName: (context) => const AboutUs(),
        TermsAndConditions.routeName: (context) => const TermsAndConditions(),
        PrivacyPolicy.routeName: (context) => const PrivacyPolicy(),
        SellerSettings.routeName: (context) => const SellerSettings(),
        FAQScreen.routeName: (context) => const FAQScreen(),
        ProductReviews.routeName: (context) => const ProductReviews(),
        SellersScreen.routeName: (context) => const SellersScreen(),
        SocialMedia.routeName: (context) => const SocialMedia(),
        WebConfig.routeName: (context) => const WebConfig(),
        MailConfig.routeName: (context) => const MailConfig(),
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
      title: 'Ecommerce Admin App',
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
