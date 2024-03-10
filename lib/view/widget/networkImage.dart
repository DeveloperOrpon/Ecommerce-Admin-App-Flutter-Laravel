import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/appConst.dart';

class NetworkImagePreview extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  const NetworkImagePreview({super.key, required this.url,  this.height,  this.width});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7),
      child: CachedNetworkImage(
        width: width,
        height: height,
        fit:BoxFit.cover,
        imageUrl:url,
        progressIndicatorBuilder: (context, url, downloadProgress) =>const CupertinoActivityIndicator(),
        errorWidget: (context, url, error) => Image.asset(appLogo),
      ),
    );
  }
}
