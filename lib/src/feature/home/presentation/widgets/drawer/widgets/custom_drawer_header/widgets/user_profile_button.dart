import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';

class UserProfileButton extends StatelessWidget {
  const UserProfileButton(
      {required String name, required String profileImage, super.key})
      : _name = name,
        _profileImage = profileImage;
  final String _name;
  final String _profileImage;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: Constants.mainBorderRadius,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: Constants.mainPadding / 2,
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: Constants.mainBorderRadius / 2,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Constants.secondaryColor),
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: CachedNetworkImage(
                      imageUrl: _profileImage,
                      errorWidget: (
                        BuildContext context,
                        String url,
                        Object error,
                      ) =>
                          Icon(
                        Icons.person_2_rounded,
                        size: 30,
                        color: Colors.white,
                      ),
                      progressIndicatorBuilder: (
                        BuildContext context,
                        String url,
                        DownloadProgress progress,
                      ) =>
                          Center(
                        child: CircularProgressIndicator.adaptive(
                          value: progress.downloaded.toDouble(),
                        ),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _name,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
