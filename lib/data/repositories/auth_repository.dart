import '../models/user_model.dart';

class AuthRepository {

  static final List<UserModel> dummyUsers = [
    UserModel(email: "nova@travelkuy.com", password: "password123", fullName: "Nova Rizki"),
    UserModel(email: "kasim@travelkuy.com", password: "travelkuy2026", fullName: "Alex"),
  ];

  bool login(String email, String password) {
    return dummyUsers.any((user) => user.email == email && user.password == password);
  }
}