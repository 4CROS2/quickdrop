class HomeProductsEntity {
  const HomeProductsEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.sellerId,
    required this.images,
  });
  final String id;
  final String name;
  final String description;
  final int price;
  final String sellerId;
  final List<String> images;
}
