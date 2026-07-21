class MenuCategoryModel {
  final int id;
  final int businessId;
  final String name;
  final int displayOrder;

  MenuCategoryModel({
    required this.id,
    required this.businessId,
    required this.name,
    required this.displayOrder,
  });

  factory MenuCategoryModel.fromJson(Map<String, dynamic> json) {
    return MenuCategoryModel(
      id: json['id'],
      businessId: json['business_id'],
      name: json['name'],
      displayOrder: json['display_order'],
    );
  }
}