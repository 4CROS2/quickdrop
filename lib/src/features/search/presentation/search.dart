import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/features/search/presentation/cubit/search_cubit.dart';
import 'package:quickdrop/src/features/search/presentation/widgets/search_header.dart';
import 'package:quickdrop/src/injection/injection_barrel.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<SearchCubit>(
        create: (BuildContext context) => sl<SearchCubit>(),
        child: BlocBuilder<SearchCubit, SearchState>(
          builder: (BuildContext context, SearchState state) {
            return CustomScrollView(
              slivers: <Widget>[
                SliverPersistentHeader(
                  delegate: SearchHeader(),
                  pinned: true,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
