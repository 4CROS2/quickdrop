import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';

class PromotionsAndDiscounts extends StatefulWidget {
  const PromotionsAndDiscounts({
    super.key,
  });

  @override
  State<PromotionsAndDiscounts> createState() => _PromotionsAndDiscountsState();
}

class _PromotionsAndDiscountsState extends State<PromotionsAndDiscounts> {
  late final PageController _controller;
  final int _realItemCount = 5;
  final int _infiniteScrollMultiplier = 1000;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: _realItemCount * _infiniteScrollMultiplier ~/ 2,
      viewportFraction: .9,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: SizedBox(
        height: 200,
        width: MediaQuery.of(context).size.width,
        child: PageView.builder(
          itemCount: _realItemCount * _infiniteScrollMultiplier,
          controller: _controller,
          pageSnapping: true,
          onPageChanged: (int index) {
            if (index == 0) {
              _controller
                  .jumpToPage(_realItemCount * _infiniteScrollMultiplier ~/ 2);
            } else if (index ==
                _realItemCount * _infiniteScrollMultiplier - 1) {
              _controller
                  .jumpToPage(_realItemCount * _infiniteScrollMultiplier ~/ 2);
            }
          },
          itemBuilder: (BuildContext context, int index) {
            final int realIndex = index % _realItemCount;
            return Container(
              width: MediaQuery.of(context).size.width * .8,
              height: double.infinity,
              margin: const EdgeInsets.symmetric(
                horizontal: 5,
              ),
              decoration: BoxDecoration(
                color: Constants.primaryColor,
                borderRadius: Constants.mainBorderRadius,
              ),
              child: Center(
                child: Text('Page $realIndex'),
              ),
            );
          },
        ),
      ),
    );
  }
}
