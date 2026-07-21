class MenuItemModel {
  final int id;
  final int businessId;
  final int categoryId;
  final String name;
  final String? description;
  final double price;
  final String? photoUrl;
  final bool isAvailable;

  MenuItemModel({
    required this.id,
    required this.businessId,
    required this.categoryId,
    required this.name,
    this.description,
    required this.price,
    this.photoUrl,
    required this.isAvailable,
  });

  factory MenuItemModel.fromJson(Map<String, dynamic> json) {
    return MenuItemModel(
      id: json['id'],
      businessId: json['business_id'],
      categoryId: json['category_id'],
      name: json['name'],
      description: json['description'],
      price: double.parse(json['price'].toString()),
      photoUrl: json['photo_url'],
      isAvailable: json['is_available'],
    );
  }
}