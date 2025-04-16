import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:shimmer/shimmer.dart';

class LoadingProductShimmer extends StatefulWidget {
  const LoadingProductShimmer({super.key});

  @override
  State<LoadingProductShimmer> createState() => _LoadingProductShimmerState();
}

class _LoadingProductShimmerState extends State<LoadingProductShimmer> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Padding(
        padding: Constants.mainPadding,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Material(
                    borderRadius: Constants.mainBorderRadius,
                    child: const SizedBox(
                      width: double.infinity,
                      height: 50,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Material(
                  borderRadius: Constants.mainBorderRadius,
                  child: const SizedBox(
                    width: 110,
                    height: 50,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Material(
                borderRadius: Constants.mainBorderRadius,
                child: const SizedBox(
                  width: double.infinity,
                  height: 120,
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Material(
                  borderRadius: Constants.mainBorderRadius,
                  child: const SizedBox(
                    width: 110,
                    height: 90,
                  ),
                ),
                SizedBox(
                  width: Constants.mainPadding.left,
                ),
                Flexible(
                  child: Material(
                    borderRadius: Constants.mainBorderRadius,
                    child: const SizedBox(
                      width: double.infinity,
                      height: 90,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: Constants.mainPadding.top,
              ),
              child: SizedBox(
                height: 100, // Limita la altura del ListView
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  children: List<Widget>.generate(
                    10,
                    (int index) => Padding(
                      padding: EdgeInsets.only(
                        right: Constants.mainPadding.right,
                      ),
                      child: Material(
                        borderRadius: Constants.mainBorderRadius,
                        child: const SizedBox(
                          width: 90,
                          height: 90,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Material(
                borderRadius: Constants.mainBorderRadius,
                child: const SizedBox(
                  width: double.infinity,
                  height: 120,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
