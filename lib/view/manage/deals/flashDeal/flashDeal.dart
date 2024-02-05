import 'package:ashique_admin_app/view/manage/deals/flashDeal/addFlashDeal.dart';
import 'package:ashique_admin_app/view/manage/deals/flashDeal/addProductFlashDeal.dart';
import 'package:ashique_admin_app/view/widget/productSwitch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FlashDeals extends StatelessWidget {
  const FlashDeals({super.key});

  @override
  Widget build(BuildContext context) {
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
          'Flash Deals',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              Get.to(AddFlashDeal(),
                  transition: Transition.rightToLeftWithFade);
            },
            label: Text("Add"),
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                _flashTitle(context, 1),
                _flashTitle(context, 2),
                _flashTitle(context, 3),
                _flashTitle(context, 4),
                _flashTitle(context, 4),
                _flashTitle(context, 4),
                _flashTitle(context, 4),
              ]),
            )
          ],
        ),
      ),
    );
  }

  _flashTitle(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(.3),
          width: .3,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 130,
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                child: Image.asset(
                  'assets/logo/banner.jpg',
                  height: 120,
                  width: Get.width * .5,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: 120,
                width: Get.width * .5,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.3)
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit,color: Colors.white,),
                ),
              )
            ],
          ),
          SizedBox(width: 10),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'FlashDeal 2025',
                maxLines: 2,
                style: GoogleFonts.fraunces(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                margin: EdgeInsets.only(bottom: 4),
                decoration: BoxDecoration(
                    color: Colors.green.shade200,
                    borderRadius: BorderRadius.circular(2)),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'START : ',
                      style: GoogleFonts.roboto(
                        fontSize: 10,
                        color: Colors.white,
                      )),
                  TextSpan(
                      text: '2024-01-02 00:00:00',
                      style: GoogleFonts.roboto(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                ])),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                margin: EdgeInsets.only(bottom: 4),
                decoration: BoxDecoration(
                    color: Colors.red.shade200,
                    borderRadius: BorderRadius.circular(2)),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'END : ',
                      style: GoogleFonts.roboto(
                        fontSize: 10,
                        color: Colors.white,
                      )),
                  TextSpan(
                      text: '2024-01-02 00:00:00',
                      style: GoogleFonts.roboto(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                ])),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(AddProductFlashDeal(),
                          transition: Transition.fadeIn);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      margin: EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(4)),
                      child: const Text(
                        'Add Product',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  const CustomSwitch(),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
