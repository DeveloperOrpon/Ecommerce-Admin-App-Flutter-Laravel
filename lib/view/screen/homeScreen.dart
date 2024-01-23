import 'package:ashique_admin_app/view/screen/products/product.dart';
import 'package:ashique_admin_app/view/widget/bottomNavBar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomWidget(),
      body: PageView(
        children: [
          ProductScreen(),
        ],
      ),
    );
  }
}
