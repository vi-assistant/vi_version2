class User {
  User({
    required this.name,
    required this.phone,
    required this.department,
    required this.password,
    required this.userId,
  });

  final String name;
  final String phone;
  final String department;
  final String password;
  final String userId;

  factory User.fromJson(Map json) {
    return User(
      name: json['name'],
      phone: json['phone'],
      department: json['department'],
      password: json['password'],
      userId: json['userId'],
    );
  }
}