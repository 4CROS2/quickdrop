import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickdrop/src/core/constants/constants.dart';

class OtherLoginBtn extends StatelessWidget {
  const OtherLoginBtn({
    required String image,
    required String label,
    VoidCallback? onTap,
    super.key,
  })  : _image = image,
        _label = label,
        _onTap = onTap;
  final String _image;
  final String _label;
  final VoidCallback? _onTap;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withValues(alpha: .12),
            blurRadius: 12.1,
            offset: const Offset(5, 5),
          )
        ],
      ),
      child: Material(
        borderRadius: Constants.mainBorderRadius,
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: _onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  _image,
                  height: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  _label,
                  style: const TextStyle(
                    fontFamily: 'Redhat',
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
