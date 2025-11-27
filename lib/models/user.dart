class User {
  User({
    required this.username,
    required this.department,
    required this.password,
    required this.userId,
  });

  final String username;
  final String department;
  final String password;
  final String userId;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      department: json['department'],
      password: json['password'],
      userId: json['userID'],
    );
  }

  Map<String, String> toJson() {
    return {
      'username': username,
      'department': department,
      'password': password,
      'userID': userId,
    };
  }
}
