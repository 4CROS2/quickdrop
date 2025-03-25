import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/core/functions/average.dart' show average;
import 'package:quickdrop/src/core/functions/price_formatter.dart';
import 'package:quickdrop/src/domain/entity/products_entity.dart';
import 'package:quickdrop/src/presentation/widgets/image_loader.dart';

class LastSeen extends StatelessWidget {
  const LastSeen({
    required this.lastSeenProducts,
    super.key,
  });
  final List<ProductsEntity> lastSeenProducts;

  @override
  Widget build(BuildContext context) {
    if (lastSeenProducts.isEmpty) {
      return SizedBox.shrink();
    }
    return Padding(
      padding: Constants.mainPadding,
      child: Material(
        elevation: 2,
        surfaceTintColor: Constants.primaryColor,
        shadowColor: Colors.transparent,
        borderRadius: Constants.mainBorderRadius,
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: Constants.mainPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Visto anteriormente',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: Constants.mainPaddingValue / 2),
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: Constants.mainPaddingValue,
                  mainAxisSpacing: Constants.mainPaddingValue,
                ),
                itemCount: lastSeenProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Material(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: Constants.mainBorderRadius / 2,
                    child: InkWell(
                      onTap: () {
                        context.push(
                          Uri(
                            path: '/product/${lastSeenProducts[index].id}',
                            queryParameters: <String, dynamic>{
                              'previewImage':lastSeenProducts[index].baseImages.first
                            },
                          ).toString(),
                        );
                      },
                      child: Padding(
                        padding: Constants.mainPadding / 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            SizedBox(
                              height: 90,
                              child: ClipRRect(
                                borderRadius: Constants.insetBorderRadius,
                                child: Hero(
                                  tag: lastSeenProducts[index].baseImages.first,
                                  child: ImageLoader(
                                    imageUrl:
                                        lastSeenProducts[index].baseImages.first,
                                  ),
                                ),
                              ),
                            ),
                            //rate
                            Row(
                              spacing: Constants.mainPaddingValue / 2,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                RatingBar.readOnly(
                                  filledIcon: Icons.star,
                                  emptyIcon: Icons.star_border,
                                  initialRating: average(
                                    ratings: lastSeenProducts[index].ratings,
                                  ),
                                  maxRating: 5,
                                  size: 18,
                                ),
                                Text(
                                  '( ${lastSeenProducts[index].ratings.length} )',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              lastSeenProducts[index].name.capitalize(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 15,
                                  height: 1),
                            ),
                            Flexible(
                              child: Text(
                                formatPrice(lastSeenProducts[index].basePrice),
                                style: TextStyle(
                                  color: Constants.primaryColor,
                                  fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
