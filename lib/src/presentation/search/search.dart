import 'package:flutter/material.dart';
import 'package:quickdrop/src/presentation/home/widgets/header/widgets/search_input.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Hero(
              tag: 'search',
              transitionOnUserGestures: true,
              child: SearchInput(
                autofocus: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
