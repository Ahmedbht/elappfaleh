enum BusinessCategory { cafe, restaurant, salon, pastry }

BusinessCategory businessCategoryFromString(String value) {
  return BusinessCategory.values.firstWhere((e) => e.name == value);
}

class BusinessModel {
  final int id;
  final int ownerId;
  final String name;
  final BusinessCategory category;
  final String? description;
  final String? address;
  final String? phone;
  final String? logoUrl;
  final bool isActive;

  BusinessModel({
    required this.id,
    required this.ownerId,
    required this.name,
    required this.category,
    this.description,
    this.address,
    this.phone,
    this.logoUrl,
    required this.isActive,
  });

  factory BusinessModel.fromJson(Map<String, dynamic> json) {
    return BusinessModel(
      id: json['id'],
      ownerId: json['owner_id'],
      name: json['name'],
      category: businessCategoryFromString(json['category']),
      description: json['description'],
      address: json['address'],
      phone: json['phone'],
      logoUrl: json['logo_url'],
      isActive: json['is_active'],
    );
  }
}