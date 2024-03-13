import 'dart:convert';
import 'dart:developer';
import 'package:ashique_admin_app/config/api/api_route.dart';
import 'package:ashique_admin_app/controller/productController.dart';
import 'package:ashique_admin_app/helper/helper.dart';
import 'package:ashique_admin_app/model/productReviewRes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../config/appConst.dart';

class ReviewTile extends StatelessWidget {
  final ReviewModel reviewModel;

  const ReviewTile({super.key, required this.reviewModel});

  @override
  Widget build(BuildContext context) {
    final productController=Get.put(ProductController());
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: reviewModel.status == 1
                  ? Colors.transparent
                  : Colors.red.withOpacity(.1),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: reviewModel.status == 1
                    ? Colors.black26
                    : Colors.red.withOpacity(.1),
                width: reviewModel.status == 1 ? .2 : 1.5,
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // User Photo
                  Container(
                      width: 40,
                      height: 40,
                      margin: EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: reviewModel.customer!.image != null
                          ? CachedNetworkImage(
                              imageUrl:
                                  '${reviewModel.customer!.image.toString().contains('http') ? "" : PROFILE_IMAGE_URL}${reviewModel.customer!.image}',
                              fit: BoxFit.cover,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      SpinKitPianoWave(
                                color: Theme.of(context).primaryColor,
                                size: 20.0,
                              ),
                              errorWidget: (context, url, error) =>
                                  const CircleAvatar(
                                backgroundImage: AssetImage(appLogo),
                              ),
                              imageBuilder: (context, imageProvider) =>
                                  CircleAvatar(
                                backgroundImage: imageProvider,
                              ),
                            )
                          : TextAvatar(
                              text: 'Orpon',
                              size: 30,
                            )),
                  // Username - Rating - Comments
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Username - Rating
                        Container(
                          margin: EdgeInsets.only(bottom: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '${reviewModel.customer!.name}| ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontFamily: 'poppins'),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Expanded(
                                          child: Text(
                                            DateFormat('dd MMM, yyyy').format(
                                                DateTime.parse(reviewModel
                                                    .createdAt
                                                    .toString())),
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor
                                                    .withOpacity(0.7),
                                                fontSize: 12,
                                                height: 150 / 100),
                                          ),
                                        )
                                      ],
                                    ),
                                    Flexible(
                                      flex: 4,
                                      child: RatingBar.builder(
                                          allowHalfRating: true,
                                          itemSize: 16,
                                          glowColor: Colors.orange[400],
                                          initialRating: num.parse(
                                                  reviewModel.rating.toString())
                                              .toDouble(),
                                          unratedColor: Theme.of(context)
                                              .primaryColor
                                              .withOpacity(.5),
                                          onRatingUpdate: (double value) {},
                                          itemBuilder: (BuildContext context,
                                                  int index) =>
                                              const Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                '${reviewModel.comment.toString()}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Theme.of(context).primaryColor.withOpacity(0.7),
                    height: 150 / 100),
              ),
              if (reviewModel.attachment != null ||
                  reviewModel.attachment!.isNotEmpty)
                SizedBox(
                    height: 100,
                    child: ListView.builder(
                      itemCount: jsonDecode(reviewModel.attachment.toString())
                          .cast<String>()
                          .length,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            // Navigator.of(context).push(
                            //   // MaterialPageRoute(
                            //   //   builder: (context) => ImageViewer(imageUrls: [
                            //   //     "${PRODUCT_REVIEW_IMAGE_URL}${review.attachment[index]}"
                            //   //   ]),
                            //   // ),
                            // );
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 5),
                            child: CachedNetworkImage(
                              imageUrl:
                                  "${PRODUCT_REVIEW_IMAGE_URL}${jsonDecode(reviewModel.attachment.toString()).cast<String>()[index]}",
                              fit: BoxFit.cover,
                              width: 100,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      SpinKitPianoWave(
                                color: Theme.of(context).primaryColor,
                                size: 20.0,
                              ),
                              errorWidget: (context, url, error) =>
                                  Image.asset(appLogo),
                            ),
                          ),
                        );
                      },
                    )),
              Container(
                padding: EdgeInsets.all(6),
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(.1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 1.5,
                    )),
                child: Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          maxLines: 2,
                          '${reviewModel.product!.name}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        leading: CachedNetworkImage(
                          imageUrl:
                              "${PRODUCT_THUMBMAIL_IMAGE_URL}${reviewModel.product!.thumbnail.toString()}",
                          fit: BoxFit.cover,
                          imageBuilder: (context, imageProvider) =>
                              CircleAvatar(
                            backgroundImage: imageProvider,
                          ),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  SpinKitPianoWave(
                            color: Theme.of(context).primaryColor,
                            size: 20.0,
                          ),
                          errorWidget: (context, url, error) =>
                              Image.asset(appLogo),
                        ),
                        subtitle: Text(
                          maxLines: 2,
                          '${reviewModel.product!.unitPrice} $currency',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: null,
                    style: ElevatedButton.styleFrom(
                        elevation: 0,

                        backgroundColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: BorderSide.none,
                        )),
                    child: const Text(
                      'Delete',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed:reviewModel.status==1? null:() async {
                      startLoading();
                      await productController.updateReview(reviewModel.id.toString(), 1);
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 0,

                        backgroundColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: BorderSide.none,
                        )),
                    child: const Text(
                      'Publish',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed:reviewModel.status==1? () async {
                      startLoading();
                      await productController.updateReview(reviewModel.id.toString(), 0);
                      Get.back();
                    }:null  ,
                    style: ElevatedButton.styleFrom(
                        elevation: 0,

                        backgroundColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: BorderSide.none,
                        )),
                    child: const Text(
                      'Un-Publish',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            deleteDialog(context, onTap: () {});
          },
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
        )
      ],
    );
  }
}
