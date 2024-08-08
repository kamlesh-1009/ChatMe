import 'dart:developer';

import "package:cached_network_image/cached_network_image.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

class NetworkImageWidget extends StatelessWidget {
  final String? imageUrl;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;
  final BorderRadius? borderRadius;

  const NetworkImageWidget({
    Key? key,
    this.height,
    this.width,
    this.color,
    this.fit,
    this.imageUrl,
    this.borderRadius = BorderRadius.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius!,
      child: kIsWeb
          ? Image.network(
              imageUrl!,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  );
                }
              },
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                log("error => $error");

                log("stackTrace => $stackTrace");
                return const Icon(Icons.error, color: appPrimaryColor);
              },
            )
          : CachedNetworkImage(
              fit: fit ?? BoxFit.cover,
              height: height,
              maxHeightDiskCache: 500,
              cacheKey: imageUrl,
              width: width,
              color: color,
              imageUrl: imageUrl!,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  const Center(
                child: CupertinoActivityIndicator(),
              ),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error, color: appPrimaryColor),
            ),
    );
  }
}
