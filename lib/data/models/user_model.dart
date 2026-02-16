// lib/data/models/user_model.dart
class UserModel {
  final String email;
  final String password;
  final String fullName;

  UserModel({
    required this.email, 
    required this.password, 
    this.fullName = "Alex",
  });
}