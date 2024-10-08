import 'package:firebase_auth/firebase_auth.dart';

class Backend {
  Backend({required FirebaseAuth firebaseAuth}) : _firebaseAuth = firebaseAuth;
  final FirebaseAuth _firebaseAuth;
  Future<Map<String, dynamic>> backend() async {
    return <String, dynamic>{};
  }
}
