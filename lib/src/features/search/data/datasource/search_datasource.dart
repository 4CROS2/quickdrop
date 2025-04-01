import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extensions/extensions.dart';
import 'package:quickdrop/src/features/search/domain/repository/search_datasource.dart';

class ISearchDatasource implements SearchDatasourceRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<Map<String, dynamic>>> fuzzySearch({
    required List<String> query,
  }) async {
    final QuerySnapshot<Map<String, dynamic>> response = await _firestore
        .collection('products')
        .where(
          'ngrams',
          arrayContainsAny: query.take(10).toList(),
        )
        .get();
    return response.toListMapJson();
  }
}
