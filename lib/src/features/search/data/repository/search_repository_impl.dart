import 'package:quickdrop/src/features/search/domain/repository/search_datasource.dart';
import 'package:quickdrop/src/features/search/domain/repository/search_repository.dart';

class ISearchRepository implements SearchRepository {
  ISearchRepository({
    required SearchDatasourceRepository datasource,
  }) : _datasource = datasource;

  final SearchDatasourceRepository _datasource;

  @override
  Future<List<String>> search({required List<String> query}) async {
    final List<Map<String, dynamic>> response =
        await _datasource.fuzzySearch(query: query);
    final List<dynamic> data = response
        .map(
          (Map<String, dynamic> product) => product['name'],
        )
        .toList();
 
    return List<String>.from(data);
  }
}
