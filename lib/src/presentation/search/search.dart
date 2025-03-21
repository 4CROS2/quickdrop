import 'package:flutter/material.dart';
import 'package:quickdrop/src/core/constants/constants.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: Constants.mainPadding,
          child: Column(
            children: <Widget>[
              Hero(
                tag: 'search',
                child: Material(
                  color: Colors.transparent,
                  child: TextFormField(
                    ignorePointers: true,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'Buscar productos',
                      prefixIcon: const Icon(Icons.search_rounded),
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
            ],
          ),
        ),
      ),
    );
  }
}
