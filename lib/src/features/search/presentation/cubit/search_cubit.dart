import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  Timer? _debounceTimer;

  Future<void> search({required String query}) async {
    // Cancelar el timer anterior si existe.
    _debounceTimer?.cancel();
    emit(Loading());
    _debounceTimer = Timer(
      Duration(milliseconds: 500),
      () {
        if (query.isEmpty) {
          emit(SearchInitial());
        } else {
          try {
            emit(
              Success(
                results: <String>[],
              ),
            );
          } catch (e) {
            emit(
              Error(
                message: e.toString(),
              ),
            );
          }
        }
      },
    );
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
  }
}
