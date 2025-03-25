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
  // late final PageController _controller;
  late final CarouselController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CarouselController(
      initialItem: 0,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: CarouselView.weighted(
        padding: Constants.mainPadding / 2,
        itemSnapping: true,
        consumeMaxWeight: true,
        onTap: (int value) {},
        controller: _controller,
        shrinkExtent: 1,
        shape: RoundedRectangleBorder(
          borderRadius: Constants.mainBorderRadius,
        ),
        flexWeights: <int>[1, 10, 1],
        children: ImageInfo.values.map((ImageInfo image) {
          return HeroLayoutCard(imageInfo: image);
        }).toList(),
      ),
    );
  }
}

class HeroLayoutCard extends StatelessWidget {
  const HeroLayoutCard({required this.imageInfo, super.key});

  final ImageInfo imageInfo;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: <Widget>[
        ClipRect(
          child: OverflowBox(
            maxWidth: width * 7 / 8,
            minWidth: width * 7 / 8,
            child: Image(
              fit: BoxFit.cover,
              image: NetworkImage(
                'https://flutter.github.io/assets-for-api-docs/assets/material/${imageInfo.url}',
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                imageInfo.title,
                overflow: TextOverflow.clip,
                softWrap: false,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: Colors.white),
              ),
              Text(
                imageInfo.subtitle,
                overflow: TextOverflow.clip,
                softWrap: false,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

enum ImageInfo {
  image0(
      title: 'The Flow',
      subtitle: 'Sponsored | Season 1 Now Streaming',
      url: 'content_based_color_scheme_1.png'),
  image1(
      title: 'Through the Pane',
      subtitle: 'Sponsored | Season 1 Now Streaming',
      url: 'content_based_color_scheme_2.png'),
  image2(
      title: 'Iridescence',
      subtitle: 'Sponsored | Season 1 Now Streaming',
      url: 'content_based_color_scheme_3.png'),
  image3(
      title: 'Sea Change',
      subtitle: 'Sponsored | Season 1 Now Streaming',
      url: 'content_based_color_scheme_4.png'),
  image4(
      title: 'Blue Symphony',
      subtitle: 'Sponsored | Season 1 Now Streaming',
      url: 'content_based_color_scheme_5.png'),
  image5(
      title: 'When It Rains',
      subtitle: 'Sponsored | Season 1 Now Streaming',
      url: 'content_based_color_scheme_6.png');

  const ImageInfo({
    required this.title,
    required this.subtitle,
    required this.url,
  });
  final String title;
  final String subtitle;
  final String url;
}
