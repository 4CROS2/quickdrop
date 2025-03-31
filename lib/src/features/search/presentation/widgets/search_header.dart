import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/search/presentation/cubit/search_cubit.dart';
import 'package:quickdrop/src/features/widgets/header_buton.dart';

class SearchHeader extends SliverPersistentHeaderDelegate {
  SearchHeader({
    required TextEditingController controller,
  }) : _controller = controller;
  final TextEditingController _controller;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(
      surfaceTintColor: Constants.secondaryColor,
      elevation: 5,
      shadowColor: Colors.transparent,
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: Padding(
            padding: Constants.mainPaddingSymetricHorizontal,
            child: Row(
              spacing: Constants.mainPaddingValue,
              children: <Widget>[
                HeaderButton.back(context),
                Flexible(
                  child: Hero(
                    tag: 'search',
                    child: Material(
                      color: Colors.transparent,
                      child: TextFormField(
                        controller: _controller,
                        autofocus: true,
                        cursorOpacityAnimates: true,
                        cursorRadius: Radius.circular(Constants.borderValue),
                        cursorColor: Constants.primaryColor,
                        onChanged: (String value) =>
                            context.read<SearchCubit>().search(
                                  query: value,
                                ),
                        style: TextStyle(
                          color: Constants.primaryColor,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Buscar productos',
                          hintStyle: TextStyle(
                            color: Constants.primaryColor,
                          ),
                          prefixIcon: const Icon(Icons.search_rounded),
                          prefixIconColor: Constants.primaryColor,
                          border: OutlineInputBorder(
                            borderRadius: Constants.mainBorderRadius,
                            gapPadding: Constants.mainPaddingValue * 2,
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          fillColor: Constants.secondaryColor,
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => Constants.minHeight;

  @override
  double get minExtent => Constants.minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
