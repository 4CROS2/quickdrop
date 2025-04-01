import 'package:quickdrop/src/features/search/domain/repository/search_repository.dart';

class SearchUsecase {
  SearchUsecase({required SearchRepository repository})
      : _repository = repository;
  final SearchRepository _repository;

  Future<List<String>> search({required List<String> query}) async =>
      await _repository.search(query: query);
}
