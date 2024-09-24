import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/core/extensions/string_extensions.dart';
import 'package:quickdrop/src/core/functions/price_formatter.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.mainPadding / 2,
      child: Material(
        elevation: 5,
        borderOnForeground: true,
        clipBehavior: Clip.hardEdge,
        borderRadius: Constants.mainBorderRadius,
        child: InkWell(
          onTap: () {
            // Acción al hacer tap
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: 'https://i.redd.it/g4crddfnmt9a1.jpg',
                progressIndicatorBuilder: (BuildContext context, String url,
                        DownloadProgress progress) =>
                    const CupertinoActivityIndicator(),
                errorWidget: (BuildContext context, String url, Object error) =>
                    const Center(
                  child: Icon(
                    Icons.error_outline,
                  ),
                ),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              // product informations
              Padding(
                padding: Constants.mainPadding.copyWith(top: 5, bottom: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //product name
                    Text(
                      'asahdjkahfjfkafhdh'.capitalize(),
                      softWrap: true,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                    //product price
                    Text(
                      formatPrice(13220),
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
