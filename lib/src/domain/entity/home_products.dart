class HomeProductsEntity {
  const HomeProductsEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.basePrice,
    required this.sellerId,
    required this.baseImages,
    //required this.tags,
  });
  final String id;
  final String name;
  final String description;
  final int basePrice;
  final String sellerId;
  final List<String> baseImages;
  //final List<String> tags;
  //final ProductVariants productVariants;
}
/* 
class ProductVariants {
  ProductVariants({
    required this.description,
    required this.price,
    required this.images,
  });
  final String description;
  final int price;
  final List<String> images;
}
 */
