import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/core/extensions/string_extensions.dart';

class TitleHeader extends StatefulWidget {
  const TitleHeader({
    required String title,
    required bool showText,
    super.key,
  })  : _title = title,
        _showText = showText;

  final String _title;
  final bool _showText;
  @override
  State<TitleHeader> createState() => _TitleHeaderState();
}

class _TitleHeaderState extends State<TitleHeader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final CurvedAnimation _curvedAnimation;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _curvedAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    );
    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_curvedAnimation);
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, .1),
      end: Offset.zero,
    ).animate(_curvedAnimation);
  }

  @override
  void didUpdateWidget(covariant TitleHeader oldWidget) {
    if (widget._showText) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Padding(
        padding: EdgeInsets.only(
          left: Constants.mainPadding.top,
        ),
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width * .60,
          child: AnimatedBuilder(
            animation: _fadeAnimation,
            builder: (BuildContext context, Widget? child) => FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: child,
              ),
            ),
            child: Text(
              widget._title.capitalize(),
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
