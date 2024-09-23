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
  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: .9);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SizedBox(
        height: 200,
        width: MediaQuery.of(context).size.width,
        child: PageView.builder(
          itemCount: 5,
          controller: _controller,
          pageSnapping: true,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              width: MediaQuery.of(context).size.width * .8,
              height: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: Constants.mainBorderRadius,
              ),
              child: Center(
                child: Text('Page $index'),
              ),
            );
          },
        ),
      ),
    );
  }
}
