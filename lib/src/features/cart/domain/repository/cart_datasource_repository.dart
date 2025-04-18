abstract interface class CartDatasourceRepository {
  Stream<List<Map<String, dynamic>>> getCartProducts();
}
