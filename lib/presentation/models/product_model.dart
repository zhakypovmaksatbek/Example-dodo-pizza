class ProductModel {
  final String name;
  final String description;
  final String price;
  final String image;

  ProductModel({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });
}

class ShopModel {
  final String categoryName;
  final List<ProductModel> products;
  double position = 0;

  ShopModel({required this.categoryName, required this.products});
}
