import 'package:quickdrop/src/feature/auth/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.email,
    required super.phone,
    required super.name,
    required super.lastname,
    required super.photo,
    required super.credits,
  });

  static UserModel fromJson({required Map<String, dynamic> json}) {
    return UserModel(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      lastname: json['lastName'] ?? '',
      name: json['name'] ?? '',
      photo: json['photoUrl'] ?? '',
      credits: json['credits'] ?? 0,
    );
  }
}
