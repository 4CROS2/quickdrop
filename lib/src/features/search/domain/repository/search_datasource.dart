abstract class SearchDatasourceRepository {
  Future<List<Map<String, dynamic>>> fuzzySearch({
    required List<String> query,
  });
}
