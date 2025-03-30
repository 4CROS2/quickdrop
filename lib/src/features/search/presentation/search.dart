import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/core/constants/constants.dart';
import 'package:quickdrop/src/features/search/presentation/cubit/search_cubit.dart';
import 'package:quickdrop/src/features/search/presentation/widgets/search_header.dart';
import 'package:quickdrop/src/injection/injection_barrel.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final TextEditingController _textEditingController;
  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

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
                  delegate: SearchHeader(
                    controller: _textEditingController,
                  ),
                  pinned: true,
                ),
                if (state is Loading)
                  SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                if (state is SearchInitial)
                  SearchStringResults(
                    type: ResultsType.history,
                    results: state.searchHistory,
                  ),
                if (state is Success)
                  SearchStringResults(
                    type: ResultsType.search,
                    results: <String>['asd'],
                  )
              ],
            );
          },
        ),
      ),
    );
  }
}

enum ResultsType { history, search }

class SearchStringResults extends StatefulWidget {
  const SearchStringResults({
    required this.results,
    required ResultsType type,
    super.key,
  }) : _type = type;
  final List<String> results;
  final ResultsType _type;

  @override
  State<SearchStringResults> createState() => _SearchStringResultsState();
}

class _SearchStringResultsState extends State<SearchStringResults> {
  @override
  Widget build(BuildContext context) {
    if (widget.results.isEmpty) {
      return SliverFillRemaining(
        child: Center(
          child: Material(
            borderRadius: Constants.mainBorderRadius,
            child: Padding(
              padding: Constants.mainPadding,
              child: Column(
                spacing: Constants.mainPaddingValue,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    widget._type == ResultsType.search
                        ? Icons.history_rounded
                        : Icons.inbox_rounded,
                    size: 50,
                    color: Constants.primaryColor,
                  ),
                  Text(
                    (widget._type == ResultsType.search
                            ? 'no se encontraron coincidencias'
                            : 'no tienes historial de busqueda')
                        .capitalize(),
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    return SliverList.builder(
      itemCount: widget.results.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: Constants.mainPadding,
          child: Material(
            borderRadius: Constants.mainBorderRadius,
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: Constants.mainPadding,
                child: Row(
                  spacing: Constants.mainPaddingValue,
                  children: <Widget>[
                    Icon(Icons.search_rounded),
                    Text(
                      widget.results[index].toString(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
