import 'package:firebase_auth/firebase_auth.dart';
import 'package:quickdrop/src/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.email,
    required super.phone,
    required super.name,
    required super.lastname,
  });

  factory UserModel.fromFireBase({
    required UserCredential crendential,
  }) {
    return UserModel(
      id: crendential.user!.uid,
      email: crendential.user!.email!,
      phone: '',
      lastname: '',
      name: '',
    );
  }

  static UserModel fromJson({required Map<String, dynamic> json}) {
    return UserModel(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      lastname: json['lastName'] ?? '',
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'email': email,
    };
  }
}
