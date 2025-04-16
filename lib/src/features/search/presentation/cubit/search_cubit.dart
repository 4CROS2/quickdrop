import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickdrop/src/core/functions/ngrams_generator.dart';
import 'package:quickdrop/src/features/search/domain/usecase/search_usecase.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required SearchUsecase usecase})
      : _usecase = usecase,
        super(const SearchInitial());
  final SearchUsecase _usecase;

  Timer? _debounceTimer;

  Future<void> search({required String query}) async {
    // Cancelar el timer anterior si existe.
    _debounceTimer?.cancel();
    emit(Loading());
    _debounceTimer = Timer(
      const Duration(milliseconds: 500),
      () async {
        if (query.isEmpty) {
          emit(const SearchInitial());
        } else {
          try {
            final List<String> ngrams = generateNgrams(query, 3);
            final List<String> response = await _usecase.search(query: ngrams);
            emit(
              Success(
                results: response,
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
