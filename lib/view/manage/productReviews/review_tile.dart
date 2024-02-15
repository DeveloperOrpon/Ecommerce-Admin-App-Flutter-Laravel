import 'dart:developer';
import 'package:ashique_admin_app/helper/helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import '../../../config/appConst.dart';


class ReviewTile extends StatelessWidget {
  const ReviewTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.black26,
                width: .2,
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
                      child: false
                          ? CachedNetworkImage(
                              imageUrl: 'Url',
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
                                          'Mofizol Hasan| ',
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
                                            '${DateFormat('dd MMM, yyyy').format(DateTime.now())}',
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
                                          allowHalfRating: false,
                                          itemSize: 16,
                                          glowColor: Colors.orange[400],
                                          initialRating: num.parse(5.toString())
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
              SizedBox(height: 10),
              Text(
                'Review Comment',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Theme.of(context).primaryColor.withOpacity(0.7),
                    height: 150 / 100),
              ),
              if (true)
                SizedBox(
                    height: 80,
                    child: ListView.builder(
                      itemCount: 2,
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
                              imageUrl: "",
                              fit: BoxFit.cover,
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
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            deleteDialog(context, onTap: (){});
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
