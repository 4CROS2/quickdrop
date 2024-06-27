import 'package:firebase_auth/firebase_auth.dart';
import 'package:quickdrop/src/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.email,
  });

  factory UserModel.fromFireBase({required UserCredential crendential}) {
    return UserModel(
      id: crendential.user!.uid,
      email: crendential.user!.email!,
    );
  }
   Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'email': email,
    };
  }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      email: json['email'] as String,
    );
  }
}
