abstract class SearchRepository {
  Future<List<String>> search({required List<String> query});
}
