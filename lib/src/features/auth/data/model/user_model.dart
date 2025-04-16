import 'package:quickdrop/src/features/auth/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.email,
    required super.phone,
    required super.name,
    required super.lastname,
    required super.photo,
    required super.credits,
    required super.isVerified,
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
      isVerified: json['isVerified'] ?? false,
    );
  }
}
