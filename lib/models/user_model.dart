enum AccountType { business, customer }

AccountType accountTypeFromString(String value) {
  return AccountType.values.firstWhere((e) => e.name == value);
}

class UserModel {
  final int id;
  final String email;
  final String fullName;
  final String? phone;
  final AccountType accountType;

  UserModel({
    required this.id,
    required this.email,
    required this.fullName,
    this.phone,
    required this.accountType,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      fullName: json['full_name'],
      phone: json['phone'],
      accountType: accountTypeFromString(json['account_type']),
    );
  }
}