class SaleModel {
  final String saleName;
  final List<ProductModel> productData;

  SaleModel({
    required this.saleName,
    required this.productData,
  });
}

class ProductModel {
  final String id;
  final String imageUrl;
  final String productName;
  final String? discountPrice;
  final String exactPrice;
  final bool? recommend;
  final String? discountPercentage;

  ProductModel({
    required this.id,
    required this.imageUrl,
    required this.productName,
    required this.exactPrice,
    this.discountPercentage,
    this.discountPrice,
    this.recommend,
  });
}
